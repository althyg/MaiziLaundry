//
//  LaundryBacket.swift
//  MaiziLaundry
//
//  Created by maiziedu on 2/26/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class LaundryBacket: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backetTableVIew: UITableView!
    var clotheArray: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backetTableVIew.delegate = self
        backetTableVIew.dataSource = self
        
        print(backetTableVIew.frame)
//        backetTableVIew.backgroundColor = UIColor.orangeColor()
        
        
        self.getClotheInBag()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.getClotheInBag()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - talbe 代理方法
    // 分组－－－－两组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var retNum = 0
        
        if section == 0 {
            
            retNum = clotheArray.count

        } else if section == 1 {
            
            retNum = 1
        } else if section == 2 {
            
            retNum = 1
        } else {
            retNum = 1
        }
        
        return retNum
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
    
        if indexPath.section == 0 {
            
            cell = tableView.dequeueReusableCellWithIdentifier("laundryCell", forIndexPath: indexPath)
            let loundryCell = cell as! LaundryBacketCell
            
            if clotheArray.count > 0 {
                
                let dic = clotheArray.objectAtIndex(indexPath.row) as! NSDictionary
                
                // 衣服单件图片
                var imageUrl = dic["clotheImage"]! as! NSString
                imageUrl = imageUrl.stringByRemovingPercentEncoding!
                
                let url:NSURL = NSURL(string: imageUrl as String)!
                let data = NSData(contentsOfURL: url)
                
                // 名称
                let aName = dic["clotheName"]! as! String
                loundryCell.clotheNameLabel.text = aName
                
                // 价格
                //            let aPrice = dic["clothePrice"]! as! String
                
                
                loundryCell.clothImageView.image = UIImage(data: data!)
            }
            
            
            loundryCell.selectionStyle = UITableViewCellSelectionStyle.None
            return loundryCell

        } else if indexPath.section == 1 {
            
            cell = tableView.dequeueReusableCellWithIdentifier("LFullPayCell", forIndexPath: indexPath)

        } else if indexPath.section == 2 {
        
            cell = tableView.dequeueReusableCellWithIdentifier("LaundryDiscountCell", forIndexPath: indexPath)
        } else {
        
            cell = tableView.dequeueReusableCellWithIdentifier("LUserProfileCell", forIndexPath: indexPath)

        }
    
        
        return cell!
    }
    
    
    //MARK: 请求用户洗衣篮数据
    func getClotheInBag() -> Void {
        
        MZRequest.getClothesInBagByUserID(userID: "0", succeed: { (clothes) in
            
            print(clothes)
            self.clotheArray = clothes
            self.backetTableVIew.reloadData()
            }) { (error) in
                
                print(error)
        }    }
}
