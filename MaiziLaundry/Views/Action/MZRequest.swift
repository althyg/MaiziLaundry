//
//  MZRequest.swift
//  MaiziLaundry
//
//  Created by maiziedu on 16/2/17.
//  Copyright © 2016年 Alatan. All rights reserved.
//

import UIKit
import Alamofire

class MZRequest: NSObject {

    static func getClothes(){
        Alamofire.request(.GET, "http://cloud.bmob.cn/a674397687f4092418b24ac840409068/getJianXiClotheList?")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
    }
}
