//
//  QuickStartViewController.swift
//  Dropbox
//
//  Created by kevin grennan on 2/6/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class QuickStartViewController: UIViewController {
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func favButton(sender: UIButton) {
        if (sender.selected == true)
        {
            sender.selected = false
            defaults.setBool(false, forKey: "favorited")
            defaults.synchronize()
        }else{
            sender.selected = true
            defaults.setBool(true, forKey: "favorited")
            defaults.synchronize()
        }
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
