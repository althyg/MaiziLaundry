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
    @IBOutlet weak var addBagNumberView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backgroundBlackView.backgroundColor = UIColor.blackColor()
        backgroundBlackView.alpha = 0.4
        
        self.initAddBagNumberViews()
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
    
    
    func initAddBagNumberViews() -> Void {
        
        let buttonsWidth:CGFloat = 80.0
        
        
        let lessButton = UIButton(type: .Custom)
        let addButton = UIButton(type: .Custom)
        let numberOfClothe = UILabel()
        
        lessButton.setTitle("－", forState: .Normal)
        lessButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        lessButton.frame = CGRectMake(1,
                                      1,
                                      buttonsWidth,
                                      CGRectGetHeight(addBagNumberView.frame)-2)
        lessButton.backgroundColor = UIColor.whiteColor()
        
        
        
        addButton.setTitle("+", forState: .Normal)
        addButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addButton.frame = CGRectMake(CGRectGetWidth(addBagNumberView.frame)-buttonsWidth-1,
                                     1,
                                     buttonsWidth,
                                     CGRectGetHeight(addBagNumberView.frame)-2)
        addButton.backgroundColor = UIColor.whiteColor()
        
        
        
        
        numberOfClothe.frame =  CGRectMake(CGRectGetMaxX(lessButton.frame)+1,
                                           1,
                                           (CGRectGetWidth(addBagNumberView.frame)-CGRectGetWidth(lessButton.frame)*2-4),
                                           CGRectGetHeight(addBagNumberView.frame)-2)
        numberOfClothe.textAlignment = NSTextAlignment.Center
        numberOfClothe.backgroundColor = UIColor.grayColor()
        
        
        addBagNumberView.addSubview(lessButton)
        addBagNumberView.addSubview(numberOfClothe)
        addBagNumberView.addSubview(addButton)
    }

    
    
}
