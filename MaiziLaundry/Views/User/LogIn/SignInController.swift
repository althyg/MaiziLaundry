//
//  SignInController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/30/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

    @IBOutlet weak var inputUserNameTF: UITextField!
    @IBOutlet weak var inputPasswordTF: UITextField!
    @IBOutlet weak var inputEmailTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func signInBtnPressed(sender: UIButton) {
        
        let user = AVUser();// 新建 AVUser 对象实例
        user.username = self.inputUserNameTF.text// 设置用户名
        user.password =  self.inputPasswordTF.text// 设置密码?
        user.email = self.inputEmailTF.text// 设置邮箱
        
        user.signUpInBackgroundWithBlock { (succeeded, error) in
            print(succeeded)
            if succeeded {
                
                let userDefault = NSUserDefaults.standardUserDefaults()
                userDefault.setObject("1", forKey: "isLogedIn")
                userDefault.setObject(self.inputUserNameTF.text, forKey: "user")
                userDefault.setObject(self.inputEmailTF.text, forKey: "email")
            } else {
                
            }
        }
    }

}
