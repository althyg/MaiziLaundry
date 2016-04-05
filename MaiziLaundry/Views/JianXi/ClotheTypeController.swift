//
//  ClotheTypeController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 16/2/2.
//  Copyright © 2016年 Alatan. All rights reserved.
//

import UIKit


class ClotheTypeController: UIViewController,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
MLMenuDelegate{

    @IBOutlet weak var menuView: MLMenuView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var selectSingleClotheVC: SelectSingleClothe?
    
    // 单件数组
    var clotheArray = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake((CGRectGetWidth(self.view.frame)-40)/2,
                                          (CGRectGetWidth(self.view.frame)-40)/2+40)
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15)
        collectionView.collectionViewLayout = flowLayout
        
        
        let singleClotheStoryboard = UIStoryboard.init(name: "SingleClotheList", bundle: NSBundle.mainBundle())
        selectSingleClotheVC = singleClotheStoryboard.instantiateViewControllerWithIdentifier("singleClothe") as? SelectSingleClothe
        self.addChildViewController(selectSingleClotheVC!)
        self.view.addSubview((selectSingleClotheVC?.view)!)
        selectSingleClotheVC?.view.hidden = true
        
        
        
        // 从服务器拿数据
        self.getClotheList(1)
        
        print("UI 加载到内存结束  001")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("界面将要显示  002")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("界面已经显示 003")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("界面将要隐藏 004")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("界面已经被显示 005")
    }
    
    
    
    
    //MARK: - 获取数据
    func getClotheList(seasonIndex: Int){
        MZRequest.getClothes(seasonIndex: seasonIndex, success: { (clothes) -> Void in
            
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
        var imageUrl = dic["clotheImage"]! as! NSString
        imageUrl = imageUrl.stringByRemovingPercentEncoding!
        
        let url:NSURL = NSURL(string: imageUrl as String)!
        let data = NSData(contentsOfURL: url)

        // 名称
        let aName = dic["clotheName"]! as! String
        item.clotheName.text = aName
        
        
        // 价格
        let aPrice = dic["clothePrice"]! as! String
        item.price.text = "\(aPrice) RMB"
        
        
        
        
        item.clotheImage.image = UIImage(data: data!)
        
        return item
    }
    
    
    //MARK: - 菜单代理方法实现

    func selectedMenu(index: Int) {
        
        self.getClotheList(index)
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("")
        if selectSingleClotheVC?.view.superview == nil {
            self.view.addSubview((selectSingleClotheVC?.view)!)
        }
        selectSingleClotheVC?.view.hidden = false
    }
}
