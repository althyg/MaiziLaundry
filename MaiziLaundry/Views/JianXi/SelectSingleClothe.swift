//
//  SelectSingleClothe.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/31/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class SelectSingleClothe: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var addNumberView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backgroundView.backgroundColor = UIColor.blackColor()
        backgroundView.alpha = 0.4
        
        self.initAddNumberViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapGestureRcognizerAction(sender: UITapGestureRecognizer) {
        
        if self.view.superview != nil{
            self.view.removeFromSuperview()
        }
    }
    
    
    

    func initAddNumberViews() -> Void {
        
        let buttonsWidth:CGFloat = 80.0
        
        
        let lessButton = UIButton(type: .Custom)
        let addButton = UIButton(type: .Custom)
        let numberOfClothe = UILabel()
        
        lessButton.setTitle("－", forState: .Normal)
        lessButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        lessButton.frame = CGRectMake(1,
                                      1,
                                      buttonsWidth,
                                      CGRectGetHeight(addNumberView.frame)-2)
        lessButton.backgroundColor = UIColor.whiteColor()
        
        
        
        addButton.setTitle("+", forState: .Normal)
        addButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addButton.frame = CGRectMake(CGRectGetWidth(addNumberView.frame)-buttonsWidth-1,
                                     1,
                                     buttonsWidth,
                                     CGRectGetHeight(addNumberView.frame)-2)
        addButton.backgroundColor = UIColor.whiteColor()
        
        
        
        
        numberOfClothe.frame =  CGRectMake(CGRectGetMaxX(lessButton.frame)+1,
                                           1,
                                           (CGRectGetWidth(addNumberView.frame)-CGRectGetWidth(lessButton.frame)*2-4),
                                           CGRectGetHeight(addNumberView.frame)-2)
        numberOfClothe.textAlignment = NSTextAlignment.Center
        numberOfClothe.backgroundColor = UIColor.grayColor()
        
        
        addNumberView.addSubview(lessButton)
        addNumberView.addSubview(numberOfClothe)
        addNumberView.addSubview(addButton)
    }
    
}
