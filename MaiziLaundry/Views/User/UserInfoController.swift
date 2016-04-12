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

    override func viewDidLoad() {
        super.viewDidLoad()

        var origionFrame = scrollView.frame
        origionFrame.size.height = CGRectGetHeight(self.view.frame)-69
        scrollView.frame = origionFrame
        
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))
        scrollView.scrollEnabled = true
        
        
//        scrollWrapView.frame = CGRectMake(0, 0, 320, 100)
//        print(NSStringFromCGRect(scrollWrapView.frame))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
