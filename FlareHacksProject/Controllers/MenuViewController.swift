//
//  ViewController.swift
//  FlareHacksProject
//
//  Created by Shreeniket Bendre on 7/24/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//
import UIKit
import InstantSearchVoiceOverlay

class MenuViewController: UIViewController {
    
    let voiceOverlay = VoiceOverlayController()
    
    
    @IBAction func didTapButton(){
        var choice = true
        let alert = UIAlertController(title: "Please choose an option", message: "Would you like the speech to text to automatically stop recording, or would you like to do it maually? Automatic will stop recording after 5 seconds of silence, while for manual, you must press a button to stop.", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Automatic", style: .default, handler: { action in
            choice = true
            self.setVoice(choice)
            print (choice)
        }))
        alert.addAction(UIAlertAction(title: "Manual", style: .default, handler: { action in
            choice = false
            self.setVoice(choice)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        print (choice)
        
        
        
    }
    
    func setVoice(_ YN: Bool) {
            
            let choice = YN
            voiceOverlay.settings.autoStop = choice
            print (choice)
            if (choice == true){
                voiceOverlay.settings.autoStopTimeout = 5
            }
            
            voiceOverlay.start(on: self, textHandler: {text, final, _ in
                
                if (final){
                    print ("Final text: \(text)")
                    
                }
                else{
                    print("In progress: \(text)")
                }
                
            }, errorHandler: {error in
            })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
}

