//
//  ReadView.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/18.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
import SnapKit
class ReadView: UIView {
    
    var webView = UIWebView()
    private var indicatorView = UIActivityIndicatorView()//加载时的旋转菊花
    private var dateLabel = UILabel()//日期
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        self.backgroundColor = UIColor.whiteColor()
        ({(webView:UIWebView) in
            webView.scrollView.showsVerticalScrollIndicator = true
            webView.scrollView.showsHorizontalScrollIndicator = false
            webView.scalesPageToFit = false//禁用缩放
            webView.tag = 1
            webView.backgroundColor = UIColor.whiteColor()
            webView.paginationBreakingMode = UIWebPaginationBreakingMode.Page
            webView.multipleTouchEnabled = false
            webView.scrollView.scrollsToTop = true
            self.addSubview(webView)
            webView.snp_makeConstraints(closure: { (make) in
                make.top.left.bottom.right.equalTo(self).offset(0)
            })
            
        }(webView))
        
        
    }
    
    
    
    
}
