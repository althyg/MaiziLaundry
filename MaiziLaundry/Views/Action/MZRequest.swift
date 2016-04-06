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
        aQuery.selectKeys(["clotheName", "clotheImage", "clothePrice", "objectId"])
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
    
    
    //MARK: 添加到洗衣篮
    static func addClotheToBag(data data: NSDictionary, succeed:(success :Bool) -> Void, failure:(error: NSError) -> Void) -> Void{
        
        let aObject = AVObject(className: "LaundryBag")
        aObject.setObject(data["clotheImage"], forKey: "clotheImage")
        aObject.setObject(data["clotheName"], forKey: "clotheName")
        aObject.setObject(data["clothePrice"], forKey: "clothePrice")
        aObject.setObject(data["clotheNumber"], forKey: "clotheNumber")
        aObject.saveInBackgroundWithBlock { (succ, error) in
            
            if succ {
                succeed(success: true)
            } else {
                failure(error: error)
            }
        }
    }

    
    
    //MARK: 获取用户洗衣篮数据
    static func getClothesInBagByUserID(userID userID:String,
                                               succeed:(clothes: NSArray) -> Void,
                                               failure:(error:NSError) -> Void) -> Void{
        
        
        let aQuery = AVQuery(className: "LaundryBag")
        aQuery.selectKeys(["clotheName", "clotheImage", "clothePrice"])
        aQuery.findObjectsInBackgroundWithBlock { (response, error) in
            print(response)
            
            let origionData = response as NSArray
            let clothesArray = NSMutableArray()
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
