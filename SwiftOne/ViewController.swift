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
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()//设置标题栏不能覆盖VC内容
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.SetNavigationBarShowRightBarButtonItem(true)
    }
    
    func SetNavigationBarShowRightBarButtonItem(_ show: Bool) {

        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "navLogo"))
        
        if show {
            
            let shareButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
            shareButton.setImage(UIImage.init(named: "nav_share_btn_normal"), for: UIControlState())
            shareButton.setImage(UIImage.init(named: "nav_share_btn_highlighted"), for: UIControlState.highlighted)
            shareButton.addTarget(self, action: #selector(share), for: UIControlEvents.touchUpInside)
            
            let rightBar = UIBarButtonItem.init(customView: shareButton)
            self.navigationItem.rightBarButtonItem = rightBar
            
        }
    }
    
    
    func share() {
        print("点击rightBar")
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    
    
        return UIView()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

