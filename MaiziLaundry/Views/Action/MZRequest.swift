//
//  MZRequest.swift
//  MaiziLaundry
//
//  Created by maiziedu on 16/2/17.
//  Copyright © 2016年 Alatan. All rights reserved.
//



/**
   此类主要负责网络相关方法
*/


import UIKit

class MZRequest: NSObject {

    //MARK: - 请求件洗衣物数据
    
    static func getClothes(seasonIndex seasonIndex:Int, success succeed:(clothes: NSArray) -> Void, failure failed:(error:NSError) -> Void) -> Void {
        
        let aQuery = AVQuery(className: "clothePrices")
        aQuery.selectKeys(["clotheName", "clotheImage", "clothePrice"])
        aQuery.whereKey("season", equalTo: "\(seasonIndex)")
        aQuery.findObjectsInBackgroundWithBlock { (object, error) -> Void in
            
            print(object)
            
            
            let origionData = object as NSArray
            
            let clothesArray = NSMutableArray()
            // 原始数组里面遍历  单个元素
            for item in origionData {
                
                // 判断单个 元素的数据类型
                if item is AVObject {
                    
                    let oneClotheDictionary = NSMutableDictionary()
                    for key in item.allKeys {
                        
                        oneClotheDictionary.setObject(item.objectForKey(key) as! String, forKey: key as! String)
                    }
                    
                    
                    clothesArray.addObject(oneClotheDictionary)
                }
            }
            
            succeed(clothes: clothesArray)
        }
        
    }

}
