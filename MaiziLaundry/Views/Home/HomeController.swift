//
//  HomeController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 1/29/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var washBagVC: WashBagController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tabBarItem.badgeValue = "9"
        self.navigationItem.title = "麦子洗衣"
//        print(self.navigationController!.navigationBar)
//        self.navigationController.navigationBar.addSubview()
        
        
        washBagVC = self.storyboard?.instantiateViewControllerWithIdentifier("washBagVC") as? WashBagController
        self.addChildViewController(washBagVC!)
        washBagVC!.view.hidden = true
        self.view.addSubview((washBagVC?.view)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func washBagButtonPressed(sender: UIButton) {
        
        print("")
        
        if washBagVC!.view.superview == nil {
            self.view.addSubview((washBagVC?.view)!)
        }
        
        washBagVC!.view.hidden = false
        
//        [UIView.animateWithDuration(0.25) { () -> Void in
//            
//        }]
    
    }
}
