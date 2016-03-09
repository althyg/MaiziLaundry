//
//  WashBagController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/9/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class WashBagController: UIViewController {

    @IBOutlet weak var backgroundBlackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backgroundBlackView.backgroundColor = UIColor.blackColor()
        backgroundBlackView.alpha = 0.4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func hideWashBag(sender: AnyObject) {
        
        if self.view.superview != nil {
            self.view.removeFromSuperview()
        }
    }
}
