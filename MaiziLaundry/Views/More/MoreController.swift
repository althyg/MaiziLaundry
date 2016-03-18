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
    
    let titles = ["练习客服", "常见问题", "服务范围", "关于我们", "用户协议", "意见反馈"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.tabelView.delegate = self
        self.tabelView.dataSource = self
        self.tabelView.registerClass(MoreCell.self, forCellReuseIdentifier: "moreCell")
        self.tabelView.separatorStyle = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
