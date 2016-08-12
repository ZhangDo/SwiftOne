//
//  RightRefreshView.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/10.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
import iCarousel
protocol RightPullToRefreshViewDelegate: class {
    /**
     又拉刷新回调
     
     - parameter rightPullRefreshView: <#rightPullRefreshView description#>
     
     - returns: Void
     */
    func rightPullRefreshViewRefrshing(rightPullRefreshView: RightRefreshView) -> Void
    /**
     当前显示的是最后一个 Item时回调  用于添加新的Item
     
     - parameter rightPullRefreshView: <#rightPullRefreshView description#>
     
     - returns: Void

     */
    func rightPullRefreshViewDidScrollToLastItem(rightPullRefreshView: RightRefreshView) -> Void
    /**
     显示完成
     
     - parameter rightPullRefreshView: rightPullRefreshView description
     - parameter Index:                <#Index description#>
     
     - returns: Void
     */
    func rightPullRefreshView(rightPullRefreshView: RightRefreshView, Index: NSInteger) -> Void
    /**
      当前要展示的Item 的下标的变化
     
     - parameter rightPullRefreshView: rightPullRefreshView
     
     - returns: Void
     */
    func rightPullRefreshViewCurrentItemAtIndexDidChange(rightPullRefreshView: RightRefreshView) -> Void
}
protocol RightPullToRefreshViewDataSource: class {
    
    /**
     一共有多少个Item
     
     - parameter rightPullRefreshView: rightPullRefreshView description
     
     - returns: item 的个数
     */
   func numberOfItemsInRightPullRefreshView(rightPullRefreshView: RightRefreshView) -> Int
    /**
     当前要显示的Item View
     
     @param rightPullRefreshView rightPullRefreshView
     @param index                当前要显示的Item 的下标
     @param view                 重用的View
     
     @return  Item 的view
     */
    func rightPullRefreshView(rightPullRefreshView:RightRefreshView, ViewForitemAtIndex: NSInteger, resuingView:UIView?) -> UIView
    
    
    
    
}



class RightRefreshView: UIView,iCarouselDelegate,iCarouselDataSource {
    
    private var Carouse = iCarousel()
    private var refreshLabel = UILabel()//刷新控件
    
    private var leftRefreshLabelWidth = CGFloat()//保持又拉刷新的宽
    private var draggedx = CGFloat() //保存右拉的 x 的距离

    private var numberOfItems = Int()
    private var isNeedRefresh = Bool()
    private var canScrollBack = Bool()//标记是否能返回上个Item
    private var lastItemIndex = NSInteger()// 最后一次显示的 item 的下标

    
    var delegate: RightPullToRefreshViewDelegate? = nil
    var dataSource: RightPullToRefreshViewDataSource? = nil
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isNeedRefresh = false
        canScrollBack = true
        draggedx = 0
        lastItemIndex = -1
        setupViews()
    }
//    override func delete(sender: AnyObject?) {
//        delegate = nil
//        dataSource = nil
//        Carouse .removeFromSuperview()
//        refreshLabel .removeFromSuperview()
//        
//    }

    private func setupViews() {
        Carouse.frame = self.bounds
        ({(ZDiCarouse: iCarousel) in
            ZDiCarouse.delegate = self
            ZDiCarouse.dataSource = self
            ZDiCarouse.type = iCarouselType.Linear
            ZDiCarouse.vertical = false
            ZDiCarouse.pagingEnabled = true
            ZDiCarouse.bounceDistance = 0.5
            ZDiCarouse.decelerationRate = 0.6
            self.addSubview(ZDiCarouse)
        
        }(Carouse))
      
        //刷新控件
        ({(refreshLabel:UILabel) in
            refreshLabel.frame = CGRectZero
            refreshLabel.font = UIFont.systemFontOfSize(10)
            refreshLabel.textColor = UIColor.init(colorLiteralRed: 90.0/255.0, green: 91.0/255.0, blue: 92.0/255.0, alpha: 1.0)
            refreshLabel.textAlignment = NSTextAlignment.Right
            refreshLabel.text = "右拉刷新..."
            refreshLabel.sizeToFit()
            refreshLabel.setNeedsLayout()
        }(refreshLabel))
        
        
        leftRefreshLabelWidth = CGRectGetWidth(refreshLabel.frame)
        let labelFrame = CGRectMake(0 - leftRefreshLabelWidth * 1.5 - 20, (CGRectGetMaxY(Carouse.frame)-CGRectGetWidth(refreshLabel.frame))/2.0, leftRefreshLabelWidth * 1.5, CGRectGetHeight(refreshLabel.frame))
        refreshLabel.frame = labelFrame
        Carouse.contentView.addSubview(refreshLabel)
    
    }
    
    //-------------公共方法---------------
    /**
     插入一个新的Item
     
     - parameter index:    新的Item的下标
     - parameter animated: 动画
     */
    func inisertItemIndex(index: NSInteger, animated: Bool) -> Void {
        numberOfItems += 1
        Carouse.insertItemAtIndex(numberOfItems - 1, animated: animated)
    }
    /**
     重新加载数据
     */
    func reloaData() {
        
        Carouse.reloadData()
    
    
    }
    /**
     重新加载指定下标的Item
     
     - parameter index:    下标
     - parameter animated: 动画
     */
    func reloadItemIndex(index: NSInteger, animated: Bool) -> Void {
        Carouse.reloadItemAtIndex(index, animated: animated)
    }
    
    func itemViewIndex(index: NSInteger) -> UIView {
        return Carouse.itemViewAtIndex(index)!
        
    }
    /**
     结束刷新
     */
    func endRefresh() {
        if isNeedRefresh {
            var frame = refreshLabel.frame
            frame.origin.x = 0 - leftRefreshLabelWidth*1.5 - 20
//            UIView.animateWithDuration(0.2, animations: { 
//                self.iCarouse.contentOffset = CGSizeMake(0, 0)
//                self.refreshLabel.frame = frame
//            } )
            UIView.animateWithDuration(0.2, animations: { 
                self.Carouse.contentOffset = CGSizeMake(0, 0)
                self.refreshLabel.frame = frame
                }, completion: { (finished:Bool) in
                    self.isNeedRefresh = false
                    self.canScrollBack = true
            })
            
        }
    
    }
    //getter
   var currentItemIndex: NSInteger {
        get {
            return Carouse.currentItemIndex
        
        }
    }
    
    var currentItemView: UIView {
        get {
            return Carouse.currentItemView!
        }
    
    }
    var contentView: UIView {
        get {
            return Carouse.contentView
        
        }
    
    }
//    var delegate: RightPullToRefreshViewDelegate {
//       
//    
//    
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Delegate&DataSource
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        if dataSource?.numberOfItemsInRightPullRefreshView(self) != nil {
            numberOfItems = (dataSource?.numberOfItemsInRightPullRefreshView(self))!
             return numberOfItems
        }else {
            return 0
        
        }
        
       
        
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        if dataSource?.rightPullRefreshView(self, ViewForitemAtIndex: index, resuingView: view!) != nil {
            return (dataSource?.rightPullRefreshView(self, ViewForitemAtIndex: index, resuingView: view!))!
        }else {
            return UIView()
        
        }
        
        
    }
    
    //Delegate
    func carouselItemWidth(carousel: iCarousel) -> CGFloat {
        return CGRectGetWidth(self.frame)
    }
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
         delegate?.rightPullRefreshViewCurrentItemAtIndexDidChange(self)
    }
    
    func carouselDidScroll(carousel: iCarousel) {
        if carousel.scrollOffset <= 0 {
            if canScrollBack {
                //计算右拉距离
                draggedx = fabs(carousel.scrollOffset * carousel.itemWidth)
                var frame = refreshLabel.frame
                frame.origin.x = draggedx - CGRectGetWidth(refreshLabel.frame) - 20
                self.refreshLabel.frame = frame
                //右拉到一定距离后 "我是有底线的"
                if draggedx >= leftRefreshLabelWidth * 1.5 + 20 {
                    refreshLabel.text = "我是有底线的"
                    isNeedRefresh = true
                }else {
                    //刷新leftRefreshLabel
                    refreshLabel.text = "右拉刷新..."
                    isNeedRefresh = true
                
                }
            }
        }
    }
    
    func carouselDidEndDragging(carousel: iCarousel, willDecelerate decelerate: Bool) {
        if !decelerate && isNeedRefresh {
            self.refreshLabel.text = "正在载入..."
            var frame = refreshLabel.frame
            frame.origin.x = leftRefreshLabelWidth - CGRectGetWidth(refreshLabel.frame)
            canScrollBack = false
            UIView.animateWithDuration(0.2, animations: { 
                carousel.contentOffset = CGSizeMake(CGRectGetMaxX(frame), 20)
                self.delegate?.rightPullRefreshViewRefrshing(self)
            })
            
        }
    }
    func carouselDidEndScrollingAnimation(carousel: iCarousel) {
        delegate?.rightPullRefreshView(self, Index: currentItemIndex)
        lastItemIndex = carousel.currentItemIndex
        
    }
    
    
}
