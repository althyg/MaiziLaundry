//
//  UserController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/16/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class UserController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var userProfileView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.addButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addButtons() {
        
        let width = CGRectGetWidth(self.view.frame)/3
        let height = CGRectGetWidth(self.view.frame)/3 + 80
        var index = 0
        
        var origionY = CGRectGetMaxY(self.userProfileView.frame)
        var oritionX:CGFloat = 0
        
        
        let images = ["U-1", "U-2", "U-3", "U-4", "U-5"]
        let titles = ["我的订单", "洗衣币", "我的地址", "分享推荐码", "验证推荐码"]
        for iamgeName in images {
            
            
            if index > 2 {
            
                oritionX = width * CGFloat(index-3)
                origionY = CGRectGetMaxY(self.userProfileView.frame) + height
                
            } else {
                
                oritionX = width * CGFloat(index)
            }
            
            
            let view = UIView(frame: CGRectMake(oritionX,
                origionY,
                width,
                height))
            
            
            let btn = UIButton(type: .Custom)
            btn.tag = index
            btn.frame = CGRectMake((CGRectGetWidth(view.frame)-142)/2,
                0,
                142,
                142)
            btn.setImage(UIImage(named: iamgeName), forState: .Normal)
            btn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            
            let label = UILabel(frame: CGRectMake(0, CGRectGetMaxY(btn.frame), CGRectGetWidth(view.frame), 30))
            label.text = titles[index]
            label.textAlignment = NSTextAlignment.Center
            
            
            view.addSubview(btn)
            view.addSubview(label)
            self.contentView.addSubview(view)
            
            print(index)
            index++
            
        }
    }
    

    
    func buttonPressed(btn: UIButton) {
        
        print(btn.tag)
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
