//
//  LogInController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/30/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class LogInController: UIViewController {

    @IBOutlet weak var inputUserNameTF: UITextField!
    @IBOutlet weak var inputPasswordTF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    // MARK: - 登陆
    @IBAction func logInPressed(sender: UIButton) {
        
        AVUser.logInWithUsernameInBackground(inputUserNameTF.text!, password: inputPasswordTF.text) { (user, error) in
            
            print(user)
            let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.setObject("1", forKey: "isLogedIn")
            userDefault.setObject(user.username, forKey: "user")
            userDefault.setObject(user.email, forKey: "email")
            
            self.navigationController?.popViewControllerAnimated(true)
            
            if error != nil {
            } else {
            }
        }
    }

    
    @IBAction func toSignIn(sender: AnyObject) {
        
        let signVC = self.storyboard?.instantiateViewControllerWithIdentifier("signVC")
//        signVC = SignInController()
        self.navigationController?.pushViewController(signVC!, animated: true)
    }
    
}
