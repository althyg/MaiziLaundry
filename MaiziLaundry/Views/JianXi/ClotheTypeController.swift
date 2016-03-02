//
//  ClotheTypeController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 16/2/2.
//  Copyright © 2016年 Alatan. All rights reserved.
//

import UIKit


class ClotheTypeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // 单件数组
    var clotheArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        // 从服务器拿数据
//        self.getClotheList()
    }
    
    //MARK: - 获取数据
    func getClotheList(){
        
    
        MZRequest.getClothes(success: { (clothes) -> Void in
            
            // 请求成功
            print(clothes)
            self.clotheArray = clothes
            
            // 重新渲染 collectionView
            self.collectionView.reloadData()
            
            }) { (error) -> Void in
                
                // 请求失败
                print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - collectionView 代理方法
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // 第一次加载 时为零
        if clotheArray.count == 0 {
            return 0
        }
        return clotheArray.count
    }
    

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("clotheCell", forIndexPath: indexPath) as! ClotheCell
        
        
        
        let dic = clotheArray.objectAtIndex(indexPath.row) as! NSDictionary
        
        
        // 衣服单件图片
        var imageUrl = dic["clothe"]! as! NSString
        imageUrl = imageUrl.stringByRemovingPercentEncoding!
        
        let url:NSURL = NSURL(string: imageUrl as String)!
        let data = NSData(contentsOfURL: url)

        // 名称
        let aName = dic["name"]! as! String
        item.clotheName.text = aName
        
        
        // 价格
        let aPrice = dic["price"]! as! String
        item.price.text = "\(aPrice) RMB"
        
        
        
        
        item.clotheImage.image = UIImage(data: data!)
        
        return item
    }
    
    // 简单布局 item
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        
//        let width = (CGRectGetWidth(self.collectionView.frame)-16)/2
//        let itemSize = CGSizeMake(width, 180)
//        return itemSize
//    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
