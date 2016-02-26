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
import Alamofire

class MZRequest: NSObject {

    //MARK: - 请求件洗衣物数据
//    static func getClothes(){
//        
//        Alamofire.request(.GET, "http://cloud.bmob.cn/7c930767cf01bdb2/getJianXiClotheList?")
//            
//        .responseJSON { (response) -> Void in
//            
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
//    }
    
    
    static func getClothes(success succeed:(clothes: NSArray) -> Void, failure failed:(error:NSError) -> Void) -> Void {
        
        Alamofire.request(.GET, "http://cloud.bmob.cn/7c930767cf01bdb2/index?")
            
            .responseJSON { (response) -> Void in
                
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    
                    
                    let dic: NSDictionary = JSON as! NSDictionary
                    let array = dic["results"] as! NSArray
                    print(array)
                    succeed(clothes: array)
                }
                
                if let error = response.result.error {
                    failed(error: error)
                }
        }
    }
    
}
