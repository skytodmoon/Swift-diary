//
//  PageTitleView.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
private let kscrollLineH : CGFloat = 2
class PageTitleView: UIView {

    //MARK: - 定义属性
    private var titles : [String]
    
    private lazy var titleLables : [UILabel] = [UILabel]()
    //MARK: - 懒加载属性
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orangeColor()
        return scrollLine
    }()
    
    //MARK: - 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    private func setupUI() {
        //添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //添加lable
        setupTitleLabels()
        
        //设置滚动条滑块
        setupButtonLineAndScrllLine()
    }
    private func setupTitleLabels(){
        
        
        let lableW : CGFloat = frame.width / CGFloat(titles.count)
        let lableH : CGFloat = frame.height - kscrollLineH
        let labelY : CGFloat = 0
        for (index, title) in titles.enumerate(){
        //创建UILable
        let label = UILabel()
        
        label.text = title
        label.tag = index
        label.font = UIFont.systemFontOfSize(16.0)
        label.textColor = UIColor.darkGrayColor()
        label.textAlignment = .Center
    
        let labelX : CGFloat = lableW * CGFloat(index)
        label.frame = CGRect(x: labelX,y: labelY,width: lableW,height: lableH)
        scrollView.addSubview(label)
        titleLables.append(label)
        }
    }
    
    private func setupButtonLineAndScrllLine() {
        let buttomLine = UIView()
        buttomLine.backgroundColor = UIColor.lightGrayColor()
        let lineH : CGFloat = 0.5
        buttomLine.frame = CGRect(x: 0,y: frame.height - lineH,width: frame.width,height: lineH)
        addSubview(buttomLine)
        
        guard let firstLable = titleLables.first else {return}
        firstLable.textColor = UIColor.orangeColor()
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x:firstLable.frame.origin.x, y: frame.height - kscrollLineH,width: firstLable.frame.width,height: kscrollLineH)
    }
}