//
//  HomeView.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/8.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
protocol praiseNumberBtnDelegate {
    func praiseBtn()
}
class HomeView: UIView {
   private var ScrollView = UIScrollView()
   private var constainerView = UIView()//容器视图
   private let volLabel = UILabel()
   private var paintImageView = UIImageView()//画
   private var paintNameLabel = UILabel()//画的名字
   private var painAuthorLabel = UILabel()//作者名字
   private var dayLabel = UILabel()//日期
   private var monthAndYearLabel = UILabel()//日期
   private var contentBGImageView = UIImageView()//年月
   private var contentTextView = UITextView()//
   private var praiseButton = UIButton()//点赞按钮
   private var indicatorView = UIActivityIndicatorView()//加载时的旋转菊花
    
   private var paintWidth: CGFloat?
   private var paintHeight: CGFloat?
    
   private var delegate: praiseNumberBtnDelegate? = nil
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
            self.setupViews()
        
    }
    
    func setupViews() {
        
        ({(ScrollView: UIScrollView) in
            ScrollView.showsVerticalScrollIndicator = true//显示垂直滚动
            ScrollView.showsHorizontalScrollIndicator = false//不显示水平滚动
            ScrollView.alwaysBounceVertical = true
            ScrollView.tag = 2
            self.addSubview(ScrollView)
            ScrollView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            })
            }(ScrollView))
        
        /**
         初始化容器视图
         - returns: self.constainerView
         */
        ({(constainerView: UIView) in
            constainerView.backgroundColor = UIColor.whiteColor()
            ScrollView.addSubview(constainerView)
            constainerView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(ScrollView)
                make.width.equalTo(ScrollView)
            })
        }(constainerView))
    
        
        ({(volLabel: UILabel) in
            volLabel.font = UIFont.systemFontOfSize(13)
            volLabel.textColor = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
            volLabel.text = "VOL.1404"
            volLabel.backgroundColor = UIColor.whiteColor()
            constainerView.addSubview(volLabel)
            volLabel.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(constainerView.snp_left).offset(10)
                make.top.equalTo(constainerView.snp_top).offset(10)
                make.right.equalTo(constainerView.snp_right).offset(-10)
                make.height.equalTo(16)
            })
        }(volLabel))
        
        //初始化图片ImageView
        ({(paintImageView: UIImageView) in
            paintImageView.backgroundColor = UIColor.blueColor()
            constainerView.addSubview(paintImageView)
           paintImageView.image = UIImage.init(named: "矢量智能对象")
            paintWidth = UIScreen.mainScreen().bounds.size.width - 20.0
            paintHeight = paintWidth! * 0.75
//            print("shiduoshao\(self.frame.size.width)")
            paintImageView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(volLabel.snp_bottom).offset(10)
                make.left.equalTo(constainerView.snp_left).offset(10)
                make.right.equalTo(constainerView.snp_right).offset(-10)
                make.height.equalTo(paintHeight!)
            })
        }(paintImageView))
        
        //画的名字
        ({(paintNameLabel: UILabel) in
            paintNameLabel.textColor = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
            paintNameLabel.text = "Walker"
            paintNameLabel.font = UIFont.systemFontOfSize(12)
            paintNameLabel.textAlignment = NSTextAlignment.Right
            constainerView.addSubview(paintNameLabel)
            paintNameLabel.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(paintImageView.snp_bottom).offset(10)
                make.left.equalTo(constainerView.snp_left).offset(10)
                make.right.equalTo(constainerView.snp_right).offset(-10)
            })
        }(paintNameLabel))
        
        //画儿的作者信息
        ({(paintAuthorLabel: UILabel) in
            paintAuthorLabel.textColor = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
            paintAuthorLabel.text = "Mule的作品"
            paintAuthorLabel.font = UIFont.systemFontOfSize(12)
            paintAuthorLabel.textAlignment = NSTextAlignment.Right
            constainerView.addSubview(paintAuthorLabel)
            
            paintAuthorLabel.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(paintNameLabel.snp_bottom).offset(0)
                make.left.equalTo(constainerView.snp_left).offset(10)
                make.right.equalTo(constainerView.snp_right).offset(-10)
            })
        }(painAuthorLabel))
        
        //日期（日）
        ({(dayLabel: UILabel) in
            dayLabel.textColor = UIColor.init(colorLiteralRed: 55.0/255.0, green: 194.0/255.0, blue: 241.0/255.0, alpha: 1.0)
            dayLabel.text = "11"
            dayLabel.backgroundColor = UIColor.whiteColor()
            dayLabel.font = UIFont(name: "HelveticaNeue-Medium",size: 43)
            dayLabel.textAlignment = NSTextAlignment.Center
            dayLabel.shadowOffset = CGSizeMake(1, 1)
            dayLabel.shadowColor = UIColor.whiteColor()
            constainerView.addSubview(dayLabel)
            
            dayLabel.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(painAuthorLabel.snp_bottom).offset(20)
                make.left.equalTo(constainerView.snp_left).offset(10)
                make.size.equalTo(CGSizeMake(70, 40))
            })
        }(dayLabel))
        
        //初始化年月
        ({(monthAndYearLabel: UILabel) in
            monthAndYearLabel.textColor = UIColor.init(colorLiteralRed: 175.0/255.0, green: 175.0/255.0, blue: 175.0/255.0, alpha: 1.0)
            monthAndYearLabel.text = "Aug,2016"
            monthAndYearLabel.textAlignment = NSTextAlignment.Center
            monthAndYearLabel.font = UIFont(name: "HelveticaNeue-Medium",size: 10)
            monthAndYearLabel.backgroundColor = UIColor.whiteColor()
            monthAndYearLabel.shadowOffset = CGSizeMake(1, 1)
            monthAndYearLabel.shadowColor = UIColor.whiteColor()
            constainerView.addSubview(monthAndYearLabel)
            
            monthAndYearLabel.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(dayLabel.snp_bottom).offset(2)
                make.left.equalTo(constainerView.snp_left).offset(10)
                make.size.equalTo(CGSizeMake(70, 12))
            })
            
        }(monthAndYearLabel))
        
        //内容背景
        ({(contentBGImageView: UIImageView) in
            contentBGImageView.image = UIImage.init(named: "contBack")?.stretchableImageWithLeftCapWidth(20, topCapHeight: 20)
            constainerView.addSubview(contentBGImageView)
            contentBGImageView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(painAuthorLabel.snp_bottom).offset(20)
                make.left.equalTo(dayLabel.snp_right).offset(10)
                make.right.equalTo(constainerView.snp_right).offset(-20)
            })
        }(contentBGImageView))
        
        //内容控件
        ({(contentTextView: UITextView) in
            contentTextView.text = "又是另一天，平凡无奇。不过幸好，平凡就是我们唯一要走的路"
            contentTextView.textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0)
            contentTextView.editable = false
            contentTextView.scrollEnabled = false
            contentTextView.backgroundColor = UIColor.clearColor()
            contentTextView.textColor = UIColor.whiteColor()
            contentBGImageView.addSubview(contentTextView)
            contentTextView.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(contentBGImageView.snp_left).offset(6)
                make.top.equalTo(contentBGImageView.snp_top).offset(0)
                make.right.equalTo(contentBGImageView.snp_right).offset(-6)
                make.bottom.equalTo(contentBGImageView.snp_bottom).offset(0)
            })
        
        }(contentTextView))
        
        //点赞按钮
        ({(praiseNumberBtn: UIButton) in
            praiseNumberBtn.setTitle("1405", forState: UIControlState.Normal)
            praiseNumberBtn.titleLabel?.font = UIFont.systemFontOfSize(12)
            praiseNumberBtn.setTitleColor(UIColor.init(colorLiteralRed: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, alpha: 1.0), forState: UIControlState.Normal)
            praiseNumberBtn.setBackgroundImage(UIImage.init(named: "home_likeBg")?.stretchableImageWithLeftCapWidth(20, topCapHeight: 2), forState: UIControlState.Normal)
            praiseNumberBtn.setImage(UIImage.init(named: "home_like"), forState: UIControlState.Normal)
            praiseNumberBtn.setImage(UIImage.init(named: "home_like_hl"), forState: UIControlState.Selected)
            praiseNumberBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 0)
            praiseNumberBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
            praiseNumberBtn.addTarget(self, action: #selector(praise), forControlEvents: UIControlEvents.TouchUpInside)
            constainerView.addSubview(praiseNumberBtn)
            praiseNumberBtn.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(contentBGImageView.snp_bottom).offset(30)
                make.right.equalTo(constainerView.snp_right).offset(0)
                make.bottom.equalTo(constainerView.snp_bottom).offset(-16)
                make.height.equalTo(28)
            })
        }(praiseButton))
        
        
        indicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        indicatorView.hidesWhenStopped = true
        
        self.addSubview(indicatorView)
        
    }
    //加载菊花
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewWithHomeEntity(homeModel: ZDContent,animated: Bool) -> Void {
        ScrollView.backgroundColor = UIColor.whiteColor()
        indicatorView.stopAnimating()
        constainerView.hidden = false
        let activationPointX = ScrollView.accessibilityActivationPoint.x
        if activationPointX > 0 && activationPointX < UIScreen.mainScreen().bounds.size.width {
            ScrollView.scrollsToTop = true
        }else {
            ScrollView.scrollsToTop = false
        
        }
        volLabel.text = homeModel.strHpTitle
        paintImageView.kf_setImageWithURL(NSURL.init(string: homeModel.strThumbnailUrl!)!, placeholderImage: nil)
        paintNameLabel.text = homeModel.strAuthor?.componentsSeparatedByString("&")[0]
        painAuthorLabel.text = homeModel.strAuthor?.componentsSeparatedByString("&")[1]
        let marketTime: NSString = ZDBaseFunction.homeENMarketTimeWithOriginalMarketTime(homeModel.strMarketTime!)
        dayLabel.text = marketTime.componentsSeparatedByString("&")[0]
        monthAndYearLabel.text = marketTime.componentsSeparatedByString("&")[1]
       
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attribute = [
            NSParagraphStyleAttributeName: paragraphStyle,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont.systemFontOfSize(13)]
        contentTextView.attributedText = NSAttributedString.init(string: homeModel.strContent!, attributes: attribute)
        contentTextView .sizeToFit()
        
        praiseButton.setTitle(homeModel.strPn, forState: UIControlState.Normal)
        praiseButton.sizeToFit()
        
        ScrollView.contentSize = CGSizeMake(0, CGRectGetHeight(constainerView.frame))
        
        
        
    }
    func startRefresh() {
        indicatorView.center = self.center
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        indicatorView.startAnimating()
    }
    
    func refreshSubviewsForNewItem() {
        volLabel.text = ""
        paintNameLabel.text = ""
        painAuthorLabel.text = ""
        dayLabel.text = ""
        monthAndYearLabel.text = ""
        contentTextView.text = ""
        contentTextView .sizeToFit()
        contentBGImageView.image = nil
        
        praiseButton.setTitle("", forState: UIControlState.Normal)
        praiseButton.sizeToFit()
        constainerView.hidden = true
        ScrollView.scrollsToTop = false
        
        self.startRefresh()
        
    }
    
    @objc private func praise() {
    delegate?.praiseBtn()
    
    
    }
   
    
}
