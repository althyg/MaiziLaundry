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
    
    var clotheDic: NSMutableDictionary?
    
    let numberOfClothe = UILabel()
    
    
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
        
        self.removieSelf()
    }
    
    func removieSelf() -> Void {
        if self.view.superview != nil{
            self.view.removeFromSuperview()
        }
    }
    

    func initAddNumberViews() -> Void {
        
        let buttonsWidth:CGFloat = 80.0
        
        
        let lessButton = UIButton(type: .Custom)
        let addButton = UIButton(type: .Custom)
        numberOfClothe.text = "0"
        
        
        lessButton.setTitle("－", forState: .Normal)
        lessButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        lessButton.frame = CGRectMake(1,
                                      1,
                                      buttonsWidth,
                                      CGRectGetHeight(addNumberView.frame)-2)
        lessButton.backgroundColor = UIColor.whiteColor()
        lessButton.addTarget(self, action: #selector(SelectSingleClothe.lessButtonAction), forControlEvents: .TouchUpInside)
        
        
        
        addButton.setTitle("+", forState: .Normal)
        addButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addButton.frame = CGRectMake(CGRectGetWidth(addNumberView.frame)-buttonsWidth-1,
                                     1,
                                     buttonsWidth,
                                     CGRectGetHeight(addNumberView.frame)-2)
        addButton.backgroundColor = UIColor.whiteColor()
        addButton.addTarget(self, action: #selector(SelectSingleClothe.addButtonAction), forControlEvents: .TouchUpInside)
        
        
        
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
    
    //MARK: - 减法
    func lessButtonAction() -> Void {
        if numberOfClothe.text != "0" {
            
            var curruntNumber = Int(numberOfClothe.text!)!
            curruntNumber -= 1
            numberOfClothe.text = "\(curruntNumber)"
        } else {
            numberOfClothe.text = "0"
        }
    }
    
    //MARK: - 加法
    func addButtonAction() -> Void {
        
        var curruntNumber = Int(numberOfClothe.text!)!
        curruntNumber += 1
        numberOfClothe.text = "\(curruntNumber)"
    }
    
    //MARK: - 加入洗衣篮
    @IBAction func addToBagAction(sender: UIButton) {
        
        if numberOfClothe.text != "0" {
            
            self.sendNotification()
            self.removieSelf()
        }
    }
    
    
    func sendNotification() -> Void {
        
//        let dic = ["clotheNumber":"\(numberOfClothe.text)"]
        clotheDic?.setObject("\(numberOfClothe.text!)", forKey: "clotheNumber")
        NSNotificationCenter.defaultCenter().postNotificationName("addSingleClotheToBag", object: clotheDic, userInfo: nil)

    }
    
    func startAnimate() -> Void {
        
        let bezierPath = UIBezierPath.init(arcCenter: CGPointMake(0, 0), radius: 3, startAngle: 9, endAngle: 4, clockwise: true)
        
    }
}
