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
    func rightPullRefreshViewRefrshing(_ rightPullRefreshView: RightRefreshView) -> Void
    /**
     当前显示的是最后一个 Item时回调  用于添加新的Item
     
     - parameter rightPullRefreshView: <#rightPullRefreshView description#>
     
     - returns: Void

     */
    func rightPullRefreshViewDidScrollToLastItem(_ rightPullRefreshView: RightRefreshView) -> Void
    /**
     显示完成
     
     - parameter rightPullRefreshView: rightPullRefreshView description
     - parameter Index:                <#Index description#>
     
     - returns: Void
     */
    func rightPullRefreshView(_ rightPullRefreshView: RightRefreshView, Index: NSInteger) -> Void
    /**
      当前要展示的Item 的下标的变化
     
     - parameter rightPullRefreshView: rightPullRefreshView
     
     - returns: Void
     */
    func rightPullRefreshViewCurrentItemAtIndexDidChange(_ rightPullRefreshView: RightRefreshView) -> Void
}
protocol RightPullToRefreshViewDataSource: class {
    
    /**
     一共有多少个Item
     
     - parameter rightPullRefreshView: rightPullRefreshView description
     
     - returns: item 的个数
     */
   func numberOfItemsInRightPullRefreshView(_ rightPullRefreshView: RightRefreshView) -> Int
    /**
     当前要显示的Item View
     
     @param rightPullRefreshView rightPullRefreshView
     @param index                当前要显示的Item 的下标
     @param view                 重用的View
     
     @return  Item 的view
     */
    func rightPullRefreshView(_ rightPullRefreshView:RightRefreshView, ViewForitemAtIndex: NSInteger, resuingView:UIView?) -> UIView
    
    
    
    
}



class RightRefreshView: UIView,iCarouselDelegate,iCarouselDataSource {
    
    fileprivate var Carouse = iCarousel()
    fileprivate var refreshLabel = UILabel()//刷新控件
    
    fileprivate var leftRefreshLabelWidth = CGFloat()//保持又拉刷新的宽
    fileprivate var draggedx = CGFloat() //保存右拉的 x 的距离

    fileprivate var numberOfItems = Int()
    fileprivate var isNeedRefresh = Bool()
    fileprivate var canScrollBack = Bool()//标记是否能返回上个Item
    fileprivate var lastItemIndex = NSInteger()// 最后一次显示的 item 的下标

    
    var delegate: RightPullToRefreshViewDelegate? = nil
    var dataSource: RightPullToRefreshViewDataSource? = nil
    
   
    //Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        isNeedRefresh = false
        canScrollBack = true
        draggedx = 0
        lastItemIndex = -1
//        setupViews()
    }
    override func delete(_ sender: Any?) {
        delegate = nil
        dataSource = nil
        Carouse .removeFromSuperview()
        refreshLabel .removeFromSuperview()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    var RefreshViewDataSource: RightPullToRefreshViewDataSource? {
        didSet {

                self.dataSource = RefreshViewDataSource
                Carouse.reloadData()
        }
    
    
    }
     func setupViews() {
      
        ({(ZDiCarouse: iCarousel) in
            ZDiCarouse.frame = self.bounds
            ZDiCarouse.delegate = self
            ZDiCarouse.dataSource = self
            ZDiCarouse.type = iCarouselType.linear
            ZDiCarouse.isVertical = false
            ZDiCarouse.isPagingEnabled = true
            ZDiCarouse.bounceDistance = 0.5
            ZDiCarouse.decelerationRate = 0.6
            ZDiCarouse.backgroundColor = UIColor.red
            self.addSubview(ZDiCarouse)
        
        }(Carouse))
      
        //刷新控件
        ({(refreshLabel:UILabel) in
            refreshLabel.frame = CGRect.zero
            refreshLabel.font = UIFont.systemFont(ofSize: 10)
            refreshLabel.textColor = UIColor.init(colorLiteralRed: 90.0/255.0, green: 91.0/255.0, blue: 92.0/255.0, alpha: 1.0)
            refreshLabel.textAlignment = NSTextAlignment.right
            refreshLabel.text = "右拉刷新..."
            refreshLabel.sizeToFit()
            refreshLabel.setNeedsLayout()
        }(refreshLabel))
        
        
        leftRefreshLabelWidth = refreshLabel.frame.width
        let labelFrame = CGRect(x: 0 - leftRefreshLabelWidth * 1.5 - 20, y: (Carouse.frame.maxY-refreshLabel.frame.width)/2.0, width: leftRefreshLabelWidth * 1.5, height: refreshLabel.frame.height)
        refreshLabel.frame = labelFrame
        Carouse.contentView.addSubview(refreshLabel)
    
    }
    
    //-------------公共方法---------------
    /**
     插入一个新的Item
     
     - parameter index:    新的Item的下标
     - parameter animated: 动画
     */
    func inisertItemIndex(_ index: NSInteger, animated: Bool) -> Void {
        numberOfItems += 1
        Carouse.insertItem(at: numberOfItems - 1, animated: animated)
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
    func reloadItemIndex(_ index: NSInteger, animated: Bool) -> Void {
        Carouse.reloadItem(at: index, animated: animated)
    }
    func itemViewIndex(_ index: NSInteger) -> UIView {
        return Carouse.itemView(at: index)!
        
    }
    /**
     结束刷新
     */
    func endRefresh() {
        if isNeedRefresh {
            var frame = refreshLabel.frame
            frame.origin.x = 0 - leftRefreshLabelWidth*1.5 - 20
            UIView.animate(withDuration: 0.2, animations: { 
                self.Carouse.contentOffset = CGSize(width: 0, height: 0)
                self.refreshLabel.frame = frame
                }, completion: { (finished:Bool) in
                    self.isNeedRefresh = false
                    self.canScrollBack = true
            })
            
        }
    
    }
   
//    var delegate: RightPullToRefreshViewDelegate {
//       
//    
//    
//    }
 
    
    //Delegate&DataSource
    func numberOfItems(in carousel: iCarousel) -> Int
    {
//        if dataSource?.numberOfItemsInRightPullRefreshView(self) != nil {
            numberOfItems = (dataSource?.numberOfItemsInRightPullRefreshView(self))!
             return numberOfItems
//        }else {
//         return 0
//        
//        }
        
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
//        if dataSource?.rightPullRefreshView(self, ViewForitemAtIndex: index, resuingView: view!) != nil {
            return (dataSource?.rightPullRefreshView(self, ViewForitemAtIndex: index, resuingView: view))!
//        }else {
//            return UIView()
//        
//        }
        
        
    }
    
    //Delegate
    func carouselItemWidth(_ carousel: iCarousel) -> CGFloat {
        return self.frame.width
    }
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
         delegate?.rightPullRefreshViewCurrentItemAtIndexDidChange(self)
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        if carousel.scrollOffset <= 0 {
            if canScrollBack {
                //计算右拉距离
                draggedx = fabs(carousel.scrollOffset * carousel.itemWidth)
                var frame = refreshLabel.frame
                frame.origin.x = draggedx - refreshLabel.frame.width - 20
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
    
    func carouselDidEndDragging(_ carousel: iCarousel, willDecelerate decelerate: Bool) {
        if !decelerate && isNeedRefresh {
            self.refreshLabel.text = "正在载入..."
            var frame = refreshLabel.frame
            frame.origin.x = leftRefreshLabelWidth - refreshLabel.frame.width
            canScrollBack = false
            UIView.animate(withDuration: 0.2, animations: { 
                carousel.contentOffset = CGSize(width: frame.maxX, height: 20)
                self.delegate?.rightPullRefreshViewRefrshing(self)
            })
            
        }
    }
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        delegate?.rightPullRefreshView(self, Index: currentItemIndex)
        lastItemIndex = carousel.currentItemIndex
        
    }
    
    
}
