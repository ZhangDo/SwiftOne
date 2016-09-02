//
//  HomeViewController.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/8.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
import iCarousel
import SwiftyJSON
class HomeViewController: ViewController, RightPullToRefreshViewDataSource,RightPullToRefreshViewDelegate, praiseNumberBtnDelegate {
   
    private var numberItems = NSInteger()//当前文章数
    private var readItems = NSMutableDictionary()//保存看过的文章
    private var lastConfigureViewForItemIndex = NSInteger()//最后展示的Item的下标
    private var isRefreshing = Bool()//当前是否是在刷新状态
    private var rightPullToReshView = RightRefreshView()
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
    
        SetNavigationBarShowRightBarButtonItem(true)
//        numberItems = 1
//        lastConfigureViewForItemIndex = 0
//        isRefreshing = false
//        print(numberItems)
//        rightPullToReshView = RightRefreshView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 64 - CGRectGetHeight(self.tabBarController!.tabBar.frame)))
//        rightPullToReshView.delegate = self;
//        rightPullToReshView.dataSource = self;
//        rightPullToReshView.setupViews()
//        self.view.addSubview(rightPullToReshView)
//        
//        
//        self.requestHomeContentAtIndex(0)
        let homeView = HomeView()
        homeView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - CGRectGetHeight((self.tabBarController?.tabBar.frame)!))
        
        self.view.addSubview(homeView)
        
        
        
    }
    
    func requestHomeContentAtIndex(index: Int) -> Void {
        let homeRequest = NetworkTool()
        homeRequest.requestHomeContentByIndex(index, successBlock: {
            (backMsg) in
//
//          /  var homeModel = HomeModel()
//            homeModel = backMsg["hpEntity"]
            
            let json = HomeModel.zz_dicToModel(backMsg["hpEntity"] as! [String : AnyObject]) as? HomeModel
            print("啦啦啦啦啦\(json!.strLastUpdateDate)")
            if self.isRefreshing {
                self.endRefreshing()
                if json?.strHpId == (self.readItems["0"] as? HomeModel)?.strHpId {
                    print("没有最新数据");
                
                }else {
                    self.readItems.removeAllObjects()
                }
                self.endRequestHomeContent(json!, index: index)
            }else {
                self.endRequestHomeContent(json!, index: index)
            
            }
            
            }) { (error) in
                print(error)
        }
        
      
    }
    
    func rightPullRefreshViewDidScrollToLastItem(rightPullRefreshView: RightRefreshView) {
        
    }
    
    func numberOfItemsInRightPullRefreshView(rightPullRefreshView: RightRefreshView) -> Int {
        return numberItems
        
    }

     func rightPullRefreshView(rightPullRefreshView: RightRefreshView, ViewForitemAtIndex: NSInteger, resuingView: UIView?) -> UIView {
//        return UIView()
//        let width = CGRectGetWidth(rightPullRefreshView.frame)
//        let height = CGRectGetHeight(rightPullRefreshView.frame)
        
//        let view = resuingView
        
        
        var homeView = HomeView()
        
        if view == nil {
            view = UIView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 64 - CGRectGetHeight(self.tabBarController!.tabBar.frame)))
//            view?.frame = CGRectMake(0, 0, width, height)
            homeView = HomeView.init(frame:view.bounds)
            view?.addSubview(homeView)
            
        }
//        else {
//            homeView = (view?.subviews[0] as! HomeView)
//            
//        }
//        
        //没有展示过的
        if ViewForitemAtIndex == numberItems - 1 || ViewForitemAtIndex == readItems.allKeys.count{
            homeView.refreshSubviewsForNewItem()
        }else {
            lastConfigureViewForItemIndex = max(ViewForitemAtIndex, lastConfigureViewForItemIndex)
            homeView.configureViewWithHomeEntity(readItems["\(ViewForitemAtIndex)"] as! ZDContent, animated: true)
        
        }
        
        return view!
    }
    
    func rightPullRefreshViewRefrshing(rightPullRefreshView: RightRefreshView) {
        
    }
    func rightPullRefreshView(rightPullRefreshView: RightRefreshView, Index: NSInteger) {
        
    }
    func rightPullRefreshViewCurrentItemAtIndexDidChange(rightPullRefreshView: RightRefreshView) {
        
    }
    func praiseBtn() {
        
    }
    override func share() {
        print("点击分享")
    }
    //停止刷新后
    func endRefreshing() {
        self.isRefreshing = false
        rightPullToReshView.endRefresh()
    }
    //保存
    func endRequestHomeContent(homeModel:HomeModel, index:Int) {
        readItems.setObject(homeModel, forKey: "\(index)")
        rightPullToReshView .reloadItemIndex(index, animated: true)
    }
    
    
}
