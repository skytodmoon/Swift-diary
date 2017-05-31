//
//  PageTitleView.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

//MARK: - 定义协议
protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView, selectedIndex index : Int)
}
//MARK: - 定义常量
private let kscrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat,CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat,CGFloat) = (255, 128 ,0)
//MARK: - 定义PageTitleView类
class PageTitleView: UIView {

    //MARK: - 定义属性
    private var currentIndex : Int = 0
    private var titles : [String]
    weak var delegate : PageTitleViewDelegate?
    
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
        
        //设置label的frame
        let lableW : CGFloat = frame.width / CGFloat(titles.count)
        let lableH : CGFloat = frame.height - kscrollLineH
        let labelY : CGFloat = 0
        for (index, title) in titles.enumerate(){
            
        //设置UILabel
        let label = UILabel()
        //设置label的属性
        label.text = title
        label.tag = index
        label.font = UIFont.systemFontOfSize(16.0)
        label.textColor = UIColor(r: kNormalColor.0,g: kNormalColor.1,b: kNormalColor.2)
        label.textAlignment = .Center
        //将lable添加到scrollView
        let labelX : CGFloat = lableW * CGFloat(index)
        label.frame = CGRect(x: labelX,y: labelY,width: lableW,height: lableH)
        scrollView.addSubview(label)
        titleLables.append(label)
            
        //添加手势
        label.userInteractionEnabled = true
        let tapGes =  UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
        label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setupButtonLineAndScrllLine() {
        let buttomLine = UIView()
        buttomLine.backgroundColor = UIColor.lightGrayColor()
        let lineH : CGFloat = 0.5
        buttomLine.frame = CGRect(x: 0,y: frame.height - lineH,width: frame.width,height: lineH)
        addSubview(buttomLine)
        
        guard let firstLable = titleLables.first else {return}
        firstLable.textColor = UIColor(r: kSelectColor.0,g: kSelectColor.1,b: kSelectColor.2)
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x:firstLable.frame.origin.x, y: frame.height - kscrollLineH,width: firstLable.frame.width,height: kscrollLineH)
    }
}

//MARK : - 监听lable的点击
extension PageTitleView {
    @objc private func titleLabelClick(tapGes : UITapGestureRecognizer){
        //获取当前的label
        guard let currentLabel = tapGes.view as? UILabel else { return }
        
        //获取之前的label
        let oldLabel = titleLables[currentIndex]
        
        //切换文字的颜色
        currentLabel.textColor = UIColor(r: kSelectColor.0,g: kSelectColor.1,b: kSelectColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0,g: kNormalColor.1,b: kNormalColor.2)
        
        //保存最新的label
        currentIndex = currentLabel.tag
        
        //滚动位置发生变化
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animateWithDuration(0.15){
            self.scrollLine.frame.origin.x = scrollLineX
        }
        //通知代理
        delegate?.pageTitleView(self, selectedIndex: currentIndex)
    }
}
//MARK : - 控制暴露方法
extension PageTitleView {
    func setTitleWithProgress(progress : CGFloat, sourceIndex : Int, targetIndex : Int){
        //取出sourceLabel和targetLabel
        let sourceLabel = titleLables[sourceIndex]
        let targetLabel = titleLables[targetIndex]
        
        //处理滑块的逻辑
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        //颜色渐变
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        //变化sourceLabel
        sourceLabel.textColor =  UIColor(r: kSelectColor.0 - colorDelta.0 * progress,g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        
        //变化targetLabel
        targetLabel.textColor =  UIColor(r: kNormalColor.0 + colorDelta.0 * progress,g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        currentIndex = targetIndex
    }
}