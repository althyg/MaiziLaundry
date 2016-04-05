//
//  MoreController.swift
//  MaiziLaundry
//
//  Created by maiziedu on 3/18/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class MoreController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    var logOutBtn: UIButton?
    
    let titles = ["练习客服", "常见问题", "服务范围", "关于我们", "用户协议", "意见反馈"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.tabelView.delegate = self
        self.tabelView.dataSource = self
        self.tabelView.registerClass(MoreCell.self, forCellReuseIdentifier: "moreCell")
        self.tabelView.separatorStyle = .None
        
        // 用户退出按钮
        logOutBtn = UIButton(type:.Custom)
        logOutBtn!.frame = CGRectMake(10, 30, CGRectGetWidth(self.view.frame)-20, 40)
        logOutBtn!.setTitle("退出", forState: .Normal)
        logOutBtn!.backgroundColor = UIColor.orangeColor()
        logOutBtn!.addTarget(self, action: #selector(MoreController.logOutAction(_:)), forControlEvents: .TouchUpInside)
        self.tabelView.tableFooterView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200))
        self.tabelView.tableFooterView?.addSubview(logOutBtn!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: - 退出操作
    func logOutAction(btn: UIButton) -> Void {
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        print("用户名:\(userDefault.objectForKey("isLogedIn"))")
        print("邮箱:\(userDefault.objectForKey("email"))")
        
        
        // 一个按钮控制登陆与退出
        if ((btn.titleLabel?.text?.containsString("退"))?.boolValue == true) {
            
            AVUser.logOut()
            userDefault.setObject("0", forKey: "isLogedIn")
            logOutBtn!.setTitle("登陆", forState: .Normal)
        } else {
            let userSB = UIStoryboard.init(name: "Users", bundle: NSBundle.mainBundle())
            let logInVC = userSB.instantiateViewControllerWithIdentifier("logIn")
            self.navigationController?.pushViewController(logInVC, animated: true)
            logOutBtn!.setTitle("退出", forState: .Normal)
        }
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("moreCell", forIndexPath: indexPath) as! MoreCell
        
       
        cell.imageView?.image = UIImage(named: "M-1-\(indexPath.row+1)")
        cell.textLabel?.text = titles[indexPath.row]
        
        
        return cell
    }
}
