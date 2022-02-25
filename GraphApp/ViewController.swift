//
//  ViewController.swift
//  GraphApp
//
//  Created by Simon Goller on 24.02.22.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var stack2: UIStackView!
    
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
       
    
        //self.image.addGestureRecognizer(gesture)
        setUpStack(_stack: stack)
        self.stack.addGestureRecognizer(gesture)
        
        setUpStack(_stack: stack2)
        self.stack2.addGestureRecognizer(gesture2)
    }
    
    @objc func clickAction(sender : UITapGestureRecognizer) {
//        counter += 1
//        textLabel.text = "Hello Pressed \(counter)"
        showPopUp()
    }
    
    func setUpImage(imageView: UIImageView) {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
    }
    
    func setUpStack(_stack: UIStackView) {
        _stack.layer.masksToBounds = false
        _stack.layer.cornerRadius = 10
        
        _stack.layer.shadowColor = UIColor.black.cgColor
        _stack.layer.shadowOpacity = 0.4
        _stack.layer.shadowOffset = .zero
        _stack.layer.shadowRadius = 5
        _stack.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func showPopUp() {
        // Prepare the popup assets
        let title = "THIS IS THE DIALOG TITLE"
        let message = "This is the message section of the popup dialog default view"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }
        buttonOne.layer.cornerRadius = 10

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "DONE", dismissOnTap: false) {
            print("What a beauty!")
        }
        buttonTwo.layer.cornerRadius = 10

        
        // extra setup
        popup.buttonAlignment = NSLayoutConstraint.Axis.horizontal
        
        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.cornerRadius = 10
        
        let overlayAppearance = PopupDialogOverlayView.appearance()
        overlayAppearance.opacity = 0.4
        

//        let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
//            print("Ah, maybe next time :)")
//        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
        
}

