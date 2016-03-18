//
//  MoreCell.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/18/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {

    var lineView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        print("")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        print("")
        
        lineView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.frame), 1))
        lineView?.backgroundColor = UIColor.grayColor()
        self.addSubview(lineView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }

}
