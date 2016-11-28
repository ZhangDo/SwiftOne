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
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 108), style: UITableViewStyle .plain)
        tableView.register(UITableViewCell .self, forCellReuseIdentifier: ID)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    /**
     Section的个数
     
     - returns: Section
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: UITableViewCellStyle .subtitle, reuseIdentifier: ID)
        Cell.textLabel?.text = "假数据 - \((indexPath as NSIndexPath).row + 1)"
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
