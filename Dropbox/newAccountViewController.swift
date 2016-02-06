//
//  newAccountViewController.swift
//  Dropbox
//
//  Created by kevin grennan on 2/3/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class newAccountViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var createButton: UIBarButtonItem!
    @IBOutlet weak var passStrength: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Focus first name field
        self.nameField.becomeFirstResponder()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
        nameField.delegate = self
        nameField.tag = 0
        surnameField.delegate = self
        surnameField.tag = 1
        emailField.delegate = self
        emailField.tag = 2
        passField.delegate = self
        passField.tag = 3
        
        
    }
    // Return key advances to next text field until last field filled, then dismisses keyboard
    func textFieldShouldReturn(nameField: UITextField) -> Bool {
        let nextTag: NSInteger = nameField.tag + 1;
        // Try to find next responder
        if let nextResponder: UIResponder! = nameField.superview!.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            ShowActionSheet(self)
        }
        return false // We do not want UITextField to insert line-breaks.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
    }
    
       @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    //Check to see if text is entered in all fields before enabling the create button.
    @IBAction func passAction(sender: AnyObject){
        if ((nameField.text?.isEmpty != nil) && (surnameField.text?.isEmpty != nil) && (emailField.text?.isEmpty != nil) && (passField.text?.isEmpty != nil)){
            self.createButton.enabled = true
        };
        if (passField.text?.characters.count > 0){
            passStrength.image = UIImage(named: "signup_1")
        };
        if (passField.text?.characters.count > 3){
        passStrength.image = UIImage(named: "signup_2")
        };
        if (passField.text?.characters.count > 6){
            passStrength.image = UIImage(named: "signup_3")
        };
        if (passField.text?.characters.count > 9){
            passStrength.image = UIImage(named: "signup_4")
        }else{
            self.createButton.enabled = false
        }
    }
    
    
    @IBAction func ShowActionSheet(sender: AnyObject) {
        let optionMenu = UIAlertController(title: "", message: "Before you can complete your registration you must accept Dropbox Terms of Service.", preferredStyle: .ActionSheet)

        let agreeAction = UIAlertAction(title: "I Agree", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("createTabSegue", sender: self)
        })
        let termsAction = UIAlertAction(title: "View Terms", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("tosSegue", sender: self)
        })

        optionMenu.addAction(agreeAction)
        optionMenu.addAction(termsAction)

        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
