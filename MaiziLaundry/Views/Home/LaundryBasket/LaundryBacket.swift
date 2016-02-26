//
//  LaundryBacket.swift
//  MaiziLaundry
//
//  Created by maiziedu on 2/26/16.
//  Copyright © 2016 Alatan. All rights reserved.
//

import UIKit

class LaundryBacket: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backetTableVIew: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backetTableVIew.delegate = self
        backetTableVIew.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - talbe 代理方法
    // 分组－－－－两组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if indexPath.row == 5 {
            cell = tableView.dequeueReusableCellWithIdentifier("LUserProfileCell", forIndexPath: indexPath)
        } else if indexPath.row == 4 {
            cell = tableView.dequeueReusableCellWithIdentifier("LaundryDiscountCell", forIndexPath: indexPath)
        } else if indexPath.row == 3 {
            cell = tableView.dequeueReusableCellWithIdentifier("LFullPayCell", forIndexPath: indexPath)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("laundryCell", forIndexPath: indexPath)
        }
        

        
        return cell!
    }
}
