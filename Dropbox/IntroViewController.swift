//
//  IntroViewController.swift
//  Dropbox
//
//  Created by kevin grennan on 2/6/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollPanel: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollPanel.contentSize = CGSize(width: 960, height: 568)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
