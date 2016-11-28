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
   fileprivate var ScrollView = UIScrollView()
   fileprivate var constainerView = UIView()//容器视图
   fileprivate let volLabel = UILabel()
   fileprivate var paintImageView = UIImageView()//画
   fileprivate var paintNameLabel = UILabel()//画的名字
   fileprivate var painAuthorLabel = UILabel()//作者名字
   fileprivate var dayLabel = UILabel()//日期
   fileprivate var monthAndYearLabel = UILabel()//日期
   fileprivate var contentBGImageView = UIImageView()//年月
   fileprivate var contentTextView = UITextView()//
   fileprivate var praiseButton = UIButton()//点赞按钮
   fileprivate var indicatorView = UIActivityIndicatorView()//加载时的旋转菊花
   fileprivate var paintWidth: CGFloat?
   fileprivate var paintHeight: CGFloat?
    
   fileprivate var delegate: praiseNumberBtnDelegate? = nil
    
    
    
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
            ScrollView.snp.makeConstraints({ (make) in
                make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            })
            }(ScrollView))
        
        /**
         初始化容器视图
         - returns: self.constainerView
         */
        ({(constainerView: UIView) in
            constainerView.backgroundColor = UIColor.white
            ScrollView.addSubview(constainerView)
            constainerView.snp.makeConstraints({ (make) in
                make.edges.equalTo(ScrollView)
                make.width.equalTo(ScrollView)
            })
        }(constainerView))
            //snp.left
        ({(volLabel: UILabel) in
            volLabel.font = UIFont.systemFont(ofSize: 13)
            volLabel.textColor = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
            volLabel.text = "VOL.1404"
            volLabel.backgroundColor = UIColor.white
            constainerView.addSubview(volLabel)
            volLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(constainerView.snp.left).offset(10)
                make.top.equalTo(constainerView.snp.top).offset(10)
                make.right.equalTo(constainerView.snp.right).offset(-10)
                make.height.equalTo(16)
            })
        }(volLabel))
        
        //初始化图片ImageView
        ({(paintImageView: UIImageView) in
            paintImageView.backgroundColor = UIColor.blue
            constainerView.addSubview(paintImageView)
           paintImageView.image = UIImage.init(named: "矢量智能对象")
            paintWidth = UIScreen.main.bounds.size.width - 20.0
            paintHeight = paintWidth! * 0.75
//            print("shiduoshao\(self.frame.size.width)")
            paintImageView.snp.makeConstraints({ (make) in
                make.top.equalTo(volLabel.snp.bottom).offset(10)
                make.left.equalTo(constainerView.snp.left).offset(10)
                make.right.equalTo(constainerView.snp.right).offset(-10)
                make.height.equalTo(paintHeight!)
            })
        }(paintImageView))
        
        //画的名字
        ({(paintNameLabel: UILabel) in
            paintNameLabel.textColor = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
            paintNameLabel.text = "Walker"
            paintNameLabel.font = UIFont.systemFont(ofSize: 12)
            paintNameLabel.textAlignment = NSTextAlignment.right
            constainerView.addSubview(paintNameLabel)
            paintNameLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(paintImageView.snp.bottom).offset(10)
                make.left.equalTo(constainerView.snp.left).offset(10)
                make.right.equalTo(constainerView.snp.right).offset(-10)
            })
        }(paintNameLabel))
        
        //画儿的作者信息
        ({(paintAuthorLabel: UILabel) in
            paintAuthorLabel.textColor = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
            paintAuthorLabel.text = "Mule的作品"
            paintAuthorLabel.font = UIFont.systemFont(ofSize: 12)
            paintAuthorLabel.textAlignment = NSTextAlignment.right
            constainerView.addSubview(paintAuthorLabel)
            
            paintAuthorLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(paintNameLabel.snp.bottom).offset(0)
                make.left.equalTo(constainerView.snp.left).offset(10)
                make.right.equalTo(constainerView.snp.right).offset(-10)
            })
        }(painAuthorLabel))
        
        //日期（日）
        ({(dayLabel: UILabel) in
            dayLabel.textColor = UIColor.init(colorLiteralRed: 55.0/255.0, green: 194.0/255.0, blue: 241.0/255.0, alpha: 1.0)
            dayLabel.text = "11"
            dayLabel.backgroundColor = UIColor.white
            dayLabel.font = UIFont(name: "HelveticaNeue-Medium",size: 43)
            dayLabel.textAlignment = NSTextAlignment.center
            dayLabel.shadowOffset = CGSize(width: 1, height: 1)
            dayLabel.shadowColor = UIColor.white
            constainerView.addSubview(dayLabel)
            dayLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(painAuthorLabel.snp.bottom).offset(20)
                make.left.equalTo(constainerView.snp.left).offset(10)
                make.size.equalTo(CGSize(width: 70, height: 40))
            })
        }(dayLabel))
        
        //初始化年月
        ({(monthAndYearLabel: UILabel) in
            monthAndYearLabel.textColor = UIColor.init(colorLiteralRed: 175.0/255.0, green: 175.0/255.0, blue: 175.0/255.0, alpha: 1.0)
            monthAndYearLabel.text = "Aug,2016"
            monthAndYearLabel.textAlignment = NSTextAlignment.center
            monthAndYearLabel.font = UIFont(name: "HelveticaNeue-Medium",size: 10)
            monthAndYearLabel.backgroundColor = UIColor.white
            monthAndYearLabel.shadowOffset = CGSize(width: 1, height: 1)
            monthAndYearLabel.shadowColor = UIColor.white
            constainerView.addSubview(monthAndYearLabel)
            monthAndYearLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(dayLabel.snp.bottom).offset(2)
                make.left.equalTo(constainerView.snp.left).offset(10)
                make.size.equalTo(CGSize(width: 70, height: 12))
            })
            
        }(monthAndYearLabel))
        
        //内容背景
        ({(contentBGImageView: UIImageView) in
            contentBGImageView.image = UIImage.init(named: "contBack")?.stretchableImage(withLeftCapWidth: 20, topCapHeight: 20)
            constainerView.addSubview(contentBGImageView)
            contentBGImageView.snp.makeConstraints({ (make) in
                make.top.equalTo(painAuthorLabel.snp.bottom).offset(20)
                make.left.equalTo(dayLabel.snp.right).offset(10)
                make.right.equalTo(constainerView.snp.right).offset(-20)
            })
        }(contentBGImageView))
        
        //内容控件
        ({(contentTextView: UITextView) in
            contentTextView.text = "又是另一天，平凡无奇。不过幸好，平凡就是我们唯一要走的路"
            contentTextView.textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0)
            contentTextView.isEditable = false
            contentTextView.isScrollEnabled = false
            contentTextView.backgroundColor = UIColor.clear
            contentTextView.textColor = UIColor.white
            contentBGImageView.addSubview(contentTextView)
            contentTextView.snp.makeConstraints({ (make) in
                make.left.equalTo(contentBGImageView.snp.left).offset(6)
                make.top.equalTo(contentBGImageView.snp.top).offset(0)
                make.right.equalTo(contentBGImageView.snp.right).offset(-6)
                make.bottom.equalTo(contentBGImageView.snp.bottom).offset(0)
            })
        
        }(contentTextView))
        
        //点赞按钮
        ({(praiseNumberBtn: UIButton) in
            praiseNumberBtn.setTitle("1405", for: UIControlState())
            praiseNumberBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            praiseNumberBtn.setTitleColor(UIColor.init(colorLiteralRed: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, alpha: 1.0), for: UIControlState())
            praiseNumberBtn.setBackgroundImage(UIImage.init(named: "home_likeBg")?.stretchableImage(withLeftCapWidth: 20, topCapHeight: 2), for: UIControlState())
            praiseNumberBtn.setImage(UIImage.init(named: "home_like"), for: UIControlState())
            praiseNumberBtn.setImage(UIImage.init(named: "home_like_hl"), for: UIControlState.selected)
            praiseNumberBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 0)
            praiseNumberBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
            praiseNumberBtn.addTarget(self, action: #selector(praise), for: UIControlEvents.touchUpInside)
            constainerView.addSubview(praiseNumberBtn)
            praiseNumberBtn.snp.makeConstraints({ (make) in
                make.top.equalTo(contentBGImageView.snp.bottom).offset(30)
                make.right.equalTo(constainerView.snp.right).offset(0)
                make.bottom.equalTo(constainerView.snp.bottom).offset(-16)
                make.height.equalTo(28)
            })
        }(praiseButton))
        
        
        indicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicatorView.hidesWhenStopped = true
        
        self.addSubview(indicatorView)
        
    }
    //加载菊花
   
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewWithHomeEntity(_ homeModel: ZDContent,animated: Bool) -> Void {
        ScrollView.backgroundColor = UIColor.white
        indicatorView.stopAnimating()
        constainerView.isHidden = false
        let activationPointX = ScrollView.accessibilityActivationPoint.x
        if activationPointX > 0 && activationPointX < UIScreen.main.bounds.size.width {
            ScrollView.scrollsToTop = true
        }else {
            ScrollView.scrollsToTop = false
        
        }
        volLabel.text = homeModel.strHpTitle

        
        paintImageView.kf.setImage(with:URL(string:homeModel.strThumbnailUrl!))
//        paintImageView.kf_setImageWithURL(URL.init(string: homeModel.strThumbnailUrl!)!, placeholderImage: nil)
        paintNameLabel.text = homeModel.strAuthor?.components(separatedBy: "&")[0]
        painAuthorLabel.text = homeModel.strAuthor?.components(separatedBy: "&")[1]
        let marketTime: NSString = ZDBaseFunction.homeENMarketTimeWithOriginalMarketTime(homeModel.strMarketTime! as NSString)
        dayLabel.text = marketTime.components(separatedBy: "&")[0]
        monthAndYearLabel.text = marketTime.components(separatedBy: "&")[1]
       
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attribute = [
            NSParagraphStyleAttributeName: paragraphStyle,
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 13)]
        contentTextView.attributedText = NSAttributedString.init(string: homeModel.strContent!, attributes: attribute)
        contentTextView .sizeToFit()
        
        praiseButton.setTitle(homeModel.strPn, for: UIControlState())
        praiseButton.sizeToFit()
        
        ScrollView.contentSize = CGSize(width: 0, height: constainerView.frame.height)
        
        
        
    }
    func startRefresh() {
        indicatorView.center = self.center
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
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
        
        praiseButton.setTitle("", for: UIControlState())
        praiseButton.sizeToFit()
        constainerView.isHidden = true
        ScrollView.scrollsToTop = false
        
        self.startRefresh()
        
    }
    
    @objc fileprivate func praise() {
    delegate?.praiseBtn()
    
    
    }
   
    
}
