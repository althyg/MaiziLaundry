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
        backetTableVIew.backgroundColor = UIColor.orangeColor()
        
        
        self.getClotheInBag()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - talbe 代理方法
    // 分组－－－－两组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if indexPath.row == 5 {
            cell = tableView.dequeueReusableCellWithIdentifier("LUserProfileCell", forIndexPath: indexPath)
        } else if indexPath.row == 4 {
            cell = tableView.dequeueReusableCellWithIdentifier("LaundryDiscountCell", forIndexPath: indexPath)
        } else if indexPath.row == 3 {
            cell = tableView.dequeueReusableCellWithIdentifier("LFullPayCell", forIndexPath: indexPath)
        } else {
            
            cell = tableView.dequeueReusableCellWithIdentifier("laundryCell", forIndexPath: indexPath)
            let loundryCell = cell as! LaundryBacketCell
//            print(loundryCell.clothImageView)
            
            
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
            
//            if indexPath.row == 0 {
//                
//                loundryCell.clothImageView.image = UIImage(named: "J-0")
//                loundryCell.clotheNameLabel.text = "夹克"
//                loundryCell.clotheNumberV.numberOfClothe.text = "10"
//            } else if indexPath.row == 1 {
//                loundryCell.clothImageView.image = UIImage(named: "J-1")
//                loundryCell.clotheNameLabel.text = "衬衫"
//                loundryCell.clotheNumberV.numberOfClothe.text = "15"
//            } else {
//                loundryCell.clothImageView.image = UIImage(named: "J-2")
//                loundryCell.clotheNameLabel.text = "皮衣"
//                loundryCell.clotheNumberV.numberOfClothe.text = "8"
//            }
            
            loundryCell.selectionStyle = UITableViewCellSelectionStyle.None
            return loundryCell
            
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
