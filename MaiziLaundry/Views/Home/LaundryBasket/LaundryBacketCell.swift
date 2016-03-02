//
//  LaundryBacketCell.swift
//  MaiziLaundry
//
//  Created by maiziedu on 2/26/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class LaundryBacketCell: UITableViewCell {

    @IBOutlet weak var clothImageView: UIImageView!
    
    @IBOutlet weak var clotheNameLabel: UILabel!
    
    @IBOutlet weak var clotheNumberV: ClotheNumberView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




class ClotheNumberView: UIView {
    
    let lessButton = UIButton(type: .Custom)
    let addButton = UIButton(type: .Custom)
    let numberOfClothe = UILabel()
    
    
    override func layoutSubviews() {
        
        
        lessButton.setTitle("－", forState: .Normal)
        lessButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        lessButton.frame = CGRectMake(1, 1, 30, CGRectGetHeight(self.frame)-2)
        lessButton.backgroundColor = UIColor.whiteColor()
        
        
        
        addButton.setTitle("+", forState: .Normal)
        addButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addButton.frame = CGRectMake(CGRectGetWidth(self.frame)-31, 1, 30, CGRectGetHeight(self.frame)-2)
        addButton.backgroundColor = UIColor.whiteColor()
        
        self.addSubview(lessButton)
        self.addSubview(addButton)
        
        
        
        
        numberOfClothe.frame =  CGRectMake(CGRectGetMaxX(lessButton.frame)+1,
            1,
            (CGRectGetWidth(self.frame)-CGRectGetWidth(lessButton.frame)-CGRectGetWidth(addButton.frame)-4),
            CGRectGetHeight(self.frame)-2)
//        numberOfClothe.text = "3"
        numberOfClothe.textAlignment = NSTextAlignment.Center
        numberOfClothe.backgroundColor = UIColor.whiteColor()
        self.addSubview(numberOfClothe)
        
    }
}
