//
//  SignInViewController.swift
//  Dropbox
//
//  Created by kevin grennan on 2/5/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var signInBut: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailField.becomeFirstResponder()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
        emailField.delegate = self
        emailField.tag = 2
        passField.delegate = self
        passField.tag = 3

        // Do any additional setup after loading the view.
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
            performSegueWithIdentifier("signInSegue", sender: nil)
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

    @IBAction func PassAction(sender: AnyObject) {
        if ((emailField.text?.isEmpty != nil) && (passField.text?.isEmpty != nil)){
            self.signInBut.enabled = true
        }else{
            self.signInBut.enabled = false
        }
    }
    
    @IBAction func forgotActions(sender: AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let forgotAction = UIAlertAction(title: "Forgot Passowrd?", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        let singleAction = UIAlertAction(title: "Single Sign-On", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel , handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(forgotAction)
        optionMenu.addAction(singleAction)
        optionMenu.addAction(cancelAction)
        
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
