//
//  ProfileViewController.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/8.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
let ID = "Cell"

class ProfileViewController: ViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetNavigationBarShowRightBarButtonItem(false)
        //创建UITableView
        
        let tableView = UITableView(frame: CGRectMake(0, 0, UIScreen .mainScreen().bounds.size.width, UIScreen .mainScreen().bounds.size.height - 108), style: UITableViewStyle .Plain)
        tableView.registerClass(UITableViewCell .self, forCellReuseIdentifier: ID)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    /**
     Section的个数
     
     - returns: Section
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: UITableViewCellStyle .Subtitle, reuseIdentifier: ID)
        Cell.textLabel?.text = "假数据 - \(indexPath.row + 1)"
        return Cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
