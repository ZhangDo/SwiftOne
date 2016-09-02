//
//  ViewController.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/8.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
import iCarousel


class ViewController: UIViewController, iCarouselDataSource,iCarouselDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None//设置标题栏不能覆盖VC内容
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.SetNavigationBarShowRightBarButtonItem(true)
    }
    
    func SetNavigationBarShowRightBarButtonItem(show: Bool) {

        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "navLogo"))
        
        if show {
            
            let shareButton = UIButton.init(frame: CGRectMake(0, 0, 22, 22))
            shareButton.setImage(UIImage.init(named: "nav_share_btn_normal"), forState: UIControlState.Normal)
            shareButton.setImage(UIImage.init(named: "nav_share_btn_highlighted"), forState: UIControlState.Highlighted)
            shareButton.addTarget(self, action: #selector(share), forControlEvents: UIControlEvents.TouchUpInside)
            
            let rightBar = UIBarButtonItem.init(customView: shareButton)
            self.navigationItem.rightBarButtonItem = rightBar
            
        }
    }
    
    
    func share() {
        print("点击rightBar")
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        return 3
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
    
    
        return UIView()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

