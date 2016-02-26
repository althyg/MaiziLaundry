//
//  MLMenuView.swift
//  MaiziLaundry
//
//  Created by maiziedu on 2/26/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class MLMenuView: UIView {
    
    // 重载
    override func layoutSubviews() {
        
        
        let menus = ["春/秋装", "夏装", "冬装", "皮衣"]
        
        var i = 0
        for title in menus {
            
            self.backgroundColor = UIColor.grayColor()
            
            let titleBtn = UIButton(type: UIButtonType.Custom)
            titleBtn.frame = CGRectMake((CGRectGetWidth(self.frame)/4) * CGFloat(i), 0, (CGRectGetWidth(self.frame)-3)/4, CGRectGetHeight(self.frame))
            titleBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            titleBtn.setTitle(title, forState: UIControlState.Normal)
            titleBtn.backgroundColor = UIColor.whiteColor()
            self.addSubview(titleBtn)
            
            i++
        }
    }
}
