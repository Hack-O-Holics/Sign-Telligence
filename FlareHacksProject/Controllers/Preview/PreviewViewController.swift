/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Contains the view controller for the Breakfast Finder.
*/

import UIKit
import AVFoundation
import Vision

class PreviewViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    
    //MARK:- Variable Decleration
    var captureSession = AVCaptureSession()
    let synth = AVSpeechSynthesizer()
    var cameraPos = AVCaptureDevice.Position.back
    var captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: AVCaptureDevice.Position.back)
    var def_bright = UIScreen.main.brightness // Default screen brightness
    var old_char = ""
        
    
    let model = try? VNCoreMLModel(for: SignLanguageRecognizer().model)
    
    
    var rectangleView = UIView()

    
    @IBOutlet weak var predictLabel: UILabel!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet var lightSwitch: UISwitch!

    
    //MARK:- IBAction Functions
    @IBAction func stop_captureSession(_ sender: UIButton) {
        captureSession.stopRunning()
        synth.stopSpeaking(at: AVSpeechBoundary.immediate)
        UIApplication.shared.isIdleTimerDisabled = false
        UIScreen.main.brightness = def_bright
    }
    @IBAction func change_camera(_ sender: Any) {
        captureSession.stopRunning()
        synth.stopSpeaking(at: AVSpeechBoundary.immediate)
        if cameraPos == AVCaptureDevice.Position.back{
            cameraPos = AVCaptureDevice.Position.front
        }else{
            if UIScreen.main.brightness != def_bright{
                UIScreen.main.brightness = def_bright
            }
            cameraPos = AVCaptureDevice.Position.back
        }
        if lightSwitch.isOn{
            lightSwitch.setOn(false, animated: true)
        }
        captureSession = AVCaptureSession()
        cameraView.layer.sublayers?[0].removeFromSuperlayer()
        old_char = ""
        self.viewDidLoad()
    }
        @IBAction func change_light(_ sender: UISwitch) {
        if cameraPos == AVCaptureDevice.Position.back{
            try? captureDevice?.lockForConfiguration()
            if sender.isOn{
                try? captureDevice?.setTorchModeOn(level: 1.0)
            }else{
                captureDevice?.torchMode = .off
            }
            captureDevice?.unlockForConfiguration()
        }else{
            if sender.isOn{
                def_bright = UIScreen.main.brightness
                UIScreen.main.brightness = CGFloat(1)
            }else{
                UIScreen.main.brightness = def_bright
            }
        }
    }
    
    
    //MARK:- View Did's
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
        
        
    }
    
   
    
    func setup(){
        
        UIApplication.shared.isIdleTimerDisabled = true // Deactivate sleep mode
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        lightSwitch.setOn(false, animated: true)
        
        captureSession.sessionPreset = .photo
        
        self.captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: cameraPos)
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice!) else {return}
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        previewLayer.frame = cameraView.bounds
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraView.layer.insertSublayer(previewLayer, at: 0)
        
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
    }
    
    
    //MARK:- Output capture by frame
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection){
        
        connection.videoOrientation = AVCaptureVideoOrientation.portrait
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        
        
        
        let request = VNCoreMLRequest(model: model!){ (fineshedReq, err) in
            
            
            guard let results = fineshedReq.results as? [VNClassificationObservation] else {print("Error at results");return}
            print("Hello")
            print("Confidence: \(results)")
            guard let firstObservation = results.first else {return}
            
            
            print(firstObservation.confidence)
            DispatchQueue.main.async {
                if firstObservation.confidence < 0.5{
                    
                    // For secondary vocalization
                    self.old_char = ""
                    self.predictLabel.text = ""
                    
                }else if self.old_char != String(firstObservation.identifier) && firstObservation.confidence > 0.95{
                    
                    self.predictLabel.text =  String(firstObservation.identifier)
                    
                    let utterance = AVSpeechUtterance(string: String(firstObservation.identifier))
                    utterance.voice = AVSpeechSynthesisVoice(language: AVSpeechSynthesisVoice.currentLanguageCode())
                    self.synth.stopSpeaking(at: AVSpeechBoundary.immediate) // For mute the previous speak.
                    self.synth.speak(utterance)
                    self.old_char = String(firstObservation.identifier)
                    
                }
            }
            
        }
            
        request.imageCropAndScaleOption = .centerCrop
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }

    
}

