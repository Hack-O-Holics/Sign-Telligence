//
//  TestViewController.swift
//  FlareHacksProjectHacksProject
//
//  Created by Shreeniket Bendre on 7/25/20.
//  Copyright © 2020 Shreeniket Bendre. All rights reserved.
//

import UIKit
import Foundation


class TestViewController: UIViewController {
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var hintText: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    //MARK:- Variables
    let arr = ["1","2","3","4","5","6","7","8","9","10",
    "a","b","c","d","e","f","g","h","i","j",
    "k","l","m","n","o","p","q","r","s","t",
    "u","v","w","x","y","z"]
    
    var integerAmount = 0
    var str = ""
    var isTrue = false
    var toEnd = false
    
    
    //MARK:- IBActions
    @IBAction func editedTextView(_ sender: Any) {
        wrongLabel.isHidden = true
        isTrue = compare()
        input.resignFirstResponder()
        if(isTrue){
            hintButton.isHidden = true
            isTrue = false
            setup()
        }
        else {
            wrongLabel.isHidden = false
        }
        if (toEnd){
            presentAlert("Good Job!", "You won! Press Play Again to play once more, or Home to return to main menu.", true)
        }
        
    }
    @IBAction func pressedHint(_ sender: Any) {
        
        let alert = UIAlertController(title: "Be careful!", message: "Using a hint will cost you a point", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.hintButton.isEnabled = false
            self.hintText.isHidden = false
            self.hintText.text = "Answer is: \(self.str)"
            self.integerAmount -= 2
            
        }))
        alert.addAction(UIAlertAction(title: "No Thanks", style: .cancel, handler: {action in
            alert.dismissMe(animated: true)
        }))
        
        self.present(alert, animated: true)
    }
    
    //MARK:- View did's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hintText.isHidden = true
        
        input.clearsOnInsertion = true
        
        self.input.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        presentAlert("Welcome to The Sign Language Test!", "Directions: In the text box, simply input the letter or number you think is displayed. If you get it right, you will earn a point. If you earn 3 points, you win! Good luck :)", false)
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Other funcs
    
    //Sets up new image
    func setup(){
        hintText.isHidden = true
        hintButton.isHidden = false
        hintButton.isEnabled = true
        str = getRandomString()
        print(str)
        imageView.image = UIImage(named: "\(str)")
    }
    
    //Gets string
    func getRandomString() -> String{
        let randomInt = Int.random(in: 0...35)
        
        let str = arr[randomInt]
        
        return str
    }
    
    //Compares
    func compare() -> Bool{
        
        var textInput = input.text
        textInput = textInput?.lowercased()
        input.text = ""
        if (str == textInput){
            integerAmount+=1
            hintButton.isEnabled = true
            hintText.isHidden = true
            pointsLabel.text = "Score: \(integerAmount)"
            
            if (integerAmount==3){
                toEnd = true
            }
            return true
        }
        return false
    }
    
    func presentAlert( _ message1: String, _ message2: String, _ showGame: Bool){
        let alert = UIAlertController(title: message1, message: message2, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Home", style: .cancel, handler: { action in
            self.performSegue(withIdentifier: "home", sender: self)
        }))
        if (showGame){
            alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
                self.pointsLabel.text = ""
                self.integerAmount = 0
                self.setup()
            }))

        }
        else{
            alert.addAction(UIAlertAction(title: "Start Game!", style: .default, handler: { action in
                self.pointsLabel.text = ""
                self.setup()
            }))

        }
        self.present(alert, animated: true)
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    
}
extension UITextField {
    
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
        toolBar.setItems([flexible, barButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
}
