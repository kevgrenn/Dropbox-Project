//
//  favoritesViewController.swift
//  Dropbox
//
//  Created by kevin grennan on 2/6/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class favoritesViewController: UIViewController, UITabBarDelegate {
    @IBOutlet weak var favoritesContent: UIImageView!
    var favState :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        favState = NSUserDefaults.standardUserDefaults().boolForKey("favorited")
        if (favState == true){
            favoritesContent.image = UIImage(named: "existing_favorites")
        }else{
            favoritesContent.image = UIImage(named: "empty_favorites")
        }
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
