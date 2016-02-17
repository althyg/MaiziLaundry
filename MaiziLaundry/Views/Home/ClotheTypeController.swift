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
    
    var images: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        
        images = ["J-0", "J-1", "J-2", "J-3"]
        
    }
    
    //MARK: - 获取数据
    func getClotheList(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("clotheCell", forIndexPath: indexPath) as! ClotheCell
        
        // 产生 0～4 之间的随机数，随机取图片
        let diceFaceCount: UInt32 = 4
        let randomRoll = Int(arc4random_uniform(diceFaceCount))
        
        item.clotheImage.image = UIImage(named: images![randomRoll])
        
        return item
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        let width = (CGRectGetWidth(self.collectionView.frame)-16)/2
        let itemSize = CGSizeMake(width, 180)
        return itemSize
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
