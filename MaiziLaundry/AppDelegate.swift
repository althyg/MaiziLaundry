//
//  AppDelegate.swift
//  MaiziLaundry
//
//  Created by maiziedu on 1/28/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        AVOSCloud.setApplicationId("6ayCVyh1XmoeNAl83XFE6uWF-gzGzoHsz", clientKey: "ShPcDDPpBomYfDIKLT5X7WYS")
        
        
        
        let userStoryboard: UIStoryboard = UIStoryboard.init(name: "Users", bundle: NSBundle.mainBundle())
        let logInVC = userStoryboard.instantiateViewControllerWithIdentifier("logInWithPhone")
        
        
        // 检查是否已经登陆
        if self.isLogedIn() {
            print("")
        } else {
            let navVC = window?.rootViewController as! UINavigationController
            navVC.pushViewController(logInVC, animated: false)
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    //MARK: - 检测用户登陆与否情况
    func isLogedIn() -> Bool {
        
        var logInState:Bool?
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        let state = userDefault.objectForKey("isLogedIn")
        if ((state?.boolValue) != nil) {
            logInState = true
        } else {
            logInState = false
        }
        return logInState!
    }

}

