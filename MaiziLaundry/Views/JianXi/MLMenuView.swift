//
//  MLMenuView.swift
//  MaiziLaundry
//
//  Created by maiziedu on 2/26/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

protocol MLMenuDelegate {
    func selectedMenu(index:Int) -> Void
}

class MLMenuView: UIView {
    var delegate:MLMenuDelegate?
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
            titleBtn.tag = i+1
            titleBtn.addTarget(self, action: #selector(MLMenuView.menuPressed(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(titleBtn)
            
            i += 1
        }
    }
    
    
    func menuPressed(btn: UIButton) -> Void {
        self.delegate?.selectedMenu(btn.tag)
    }
}
