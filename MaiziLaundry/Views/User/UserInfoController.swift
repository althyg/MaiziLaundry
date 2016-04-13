//
//  UserInfoController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 4/12/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollWrapView: UIView!
    
    
    @IBOutlet weak var inputUnameTF: UITextField!
    @IBOutlet weak var setSexMenBtn: UIButton!
    @IBOutlet weak var setSexWomenBtn: UIButton!
    
    
    @IBOutlet weak var inputPhoneNumTF: UITextField!
    @IBOutlet weak var addressTitleBtn: UIButton!
    
    
    @IBOutlet weak var cityWrapperView: UIView!
    @IBOutlet weak var cityAddressInputTf: UITextField!
    @IBOutlet weak var selectCityBtn: UIButton!
    
    
    @IBOutlet weak var inputXiaoquTF: UITextField!
    @IBOutlet weak var inputDetailAddressTF: UITextField!
    

    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var origionFrame = scrollView.frame
        origionFrame.size.height = CGRectGetHeight(self.view.frame)-69
        scrollView.frame = origionFrame
        
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(UIScreen.mainScreen().bounds))
        scrollView.scrollEnabled = true
        
        
//        self.setSubviewsFrame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        scrollWrapView.frame = CGRectMake(0, 0, 320, 100)
        print(NSStringFromCGRect(scrollWrapView.frame))

    }

    
    
    func setSubviewsFrame() -> Void {
        
        self.view.frame = CGRectMake(0,
                                     64,
                                     CGRectGetWidth(UIScreen.mainScreen().bounds),
                                     CGRectGetHeight(UIScreen.mainScreen().bounds)-64-49)
        
        
        self.scrollView.frame = CGRectMake(0,
                                           64,
                                           CGRectGetWidth(UIScreen.mainScreen().bounds),
                                           CGRectGetHeight(UIScreen.mainScreen().bounds)-64-49)
        
        self.scrollWrapView.frame = CGRectMake(0,
                                               0,
                                               CGRectGetWidth(self.scrollView.frame),
                                               CGRectGetHeight(UIScreen.mainScreen().bounds))
        
        
        self.inputUnameTF.frame = CGRectMake(8,
                                             25,
                                             CGRectGetWidth(self.view.frame)-160,
                                             40)
        self.setSexMenBtn.frame = CGRectMake(CGRectGetMaxX(self.inputUnameTF.frame)+8,
                                             CGRectGetMinY(self.inputUnameTF.frame),
                                             60,
                                             40)
        
        self.setSexWomenBtn.frame = CGRectMake(CGRectGetMaxX(self.setSexMenBtn.frame)+8,
                                               CGRectGetMinY(self.inputUnameTF.frame),
                                               60,
                                               40)
        
        self.inputPhoneNumTF.frame = CGRectMake(8,
                                                CGRectGetMaxY(self.inputUnameTF.frame)+18,
                                                CGRectGetWidth(self.view.frame)-16,
                                                40)
        
        
        self.addressTitleBtn.frame = CGRectMake(8,
                                                CGRectGetMaxY(self.inputPhoneNumTF.frame)+18,
                                                200,
                                                30)
        
        self.cityWrapperView.frame = CGRectMake(8,
                                                CGRectGetMaxY(self.addressTitleBtn.frame)+8,
                                                CGRectGetWidth(self.view.frame)-16,
                                                40)
        
        self.cityAddressInputTf.frame = CGRectMake(2,
                                                   5,
                                                   CGRectGetWidth(self.cityWrapperView.frame)-80,
                                                   30)
        self.selectCityBtn.frame = CGRectMake(CGRectGetMaxX(self.cityAddressInputTf.frame)+8,
                                              5,
                                              60,
                                              30)
        self.inputXiaoquTF.frame = CGRectMake(8,
                                              CGRectGetMaxY(self.cityWrapperView.frame)+18,
                                              CGRectGetWidth(self.cityWrapperView.frame),
                                              40)
        
        self.inputDetailAddressTF.frame = CGRectMake(8,
                                                     CGRectGetMaxY(self.inputXiaoquTF.frame)+18,
                                                     CGRectGetWidth(self.inputXiaoquTF.frame),
                                                     40)
        
        self.noteTitleLabel.frame = CGRectMake(8,
                                               CGRectGetMaxY(self.inputDetailAddressTF.frame)+18,
                                               CGRectGetWidth(self.inputDetailAddressTF.frame),
                                               20)
        self.saveBtn.frame = CGRectMake(8,
                                        CGRectGetMaxY(self.noteTitleLabel.frame)+20,
                                        CGRectGetWidth(self.noteTitleLabel.frame),
                                        40)
        
    }
}
