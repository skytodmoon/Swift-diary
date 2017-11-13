//
//  EssenceViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/10.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class EssenceViewController: UIViewController {
    var currentButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        setupNavigationBar()
        setupContentView()
        
        setupTitleView()
        
        setupChildViewControllers()
        
        scrollViewDidEndDecelerating(contentView)
        // Do any additional setup after loading the view.
    }

    
    /// 标题内容
    lazy var titles: [String] = {
        let array = ["全部内容","视频","声音","图片","段子"]
        return array
    }()
    
    /// 滑动的View
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var contentView: UIScrollView = {
        let sv = UIScrollView(frame: self.view.bounds)
        sv.contentSize = CGSize(width: self.view.frame.width * CGFloat(self.titles.count), height: 0)
        if #available(iOS 11.0, *) {
            sv.contentInsetAdjustmentBehavior = .never
        }
        sv.bounces = false
        sv.isPagingEnabled = true
        sv.delegate = self
        return sv
    }()
}

// MARK: - 设置UI
extension EssenceViewController {
    
    /// 设置导航栏
    fileprivate func setupNavigationBar() {
        // 设置导航栏标题
        navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        // 设置导航栏左边的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "MainTagSubIcon", highImage: "MainTagSubIconClick", targat: self, action: #selector(tagClick))
    }
    @objc func tagClick() {
        let vc = RecommendTagsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// 设置TitleView
    fileprivate func setupTitleView() {
        
        var currentHeight: CGFloat = 64
        
        if view.frame.height == iPhoneXHeight {
            currentHeight += iPhoneXTopHeight
        }
        
        let titleView = UIView(frame: CGRect(x: 0, y: currentHeight, width: view.frame.width, height: 35))
        titleView.backgroundColor = UIColor.init(white: 1.0, alpha: 0.7)
        view.addSubview(titleView)
        
        for i in 0..<titles.count {
            let button = UIButton(type: .custom)
            button.tag = 100 + i
            button.setTitle(titles[i], for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.setTitleColor(UIColor.red, for: .disabled)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(clickTitleView(_:)), for: .touchUpInside)
            let width = titleView.frame.width / CGFloat(titles.count)
            let height = titleView.frame.height
            button.frame = CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height - 2)
            //            button.layoutIfNeeded() //不能立即获取button的label的frame 需要强制布局
            titleView.addSubview(button)
            if i == 0 {
                button.titleLabel?.sizeToFit()
                self.bottomView.frame = CGRect(x: 0, y: 0, width: button.titleLabel!.frame.width, height: 2)
                self.bottomView.center = CGPoint(x: button.center.x, y:button.frame.height + 1)
                titleView.addSubview(bottomView)
                clickTitleView(button)
            }
        }
    }
    @objc fileprivate func clickTitleView(_ sender: UIButton) {
        currentButton.isEnabled = true
        currentButton = sender
        currentButton.isEnabled = false
        
        UIView.animate(withDuration: 0.25) {
            self.bottomView.frame = CGRect(x: 0, y: 0, width: self.currentButton.titleLabel!.frame.width, height: 2)
            self.bottomView.center = CGPoint(x: self.currentButton.center.x, y:self.currentButton.frame.height + 1)
        }
        
        var offSet = contentView.contentOffset
        offSet.x = CGFloat(sender.tag - 100) * contentView.frame.width
        contentView.setContentOffset(offSet, animated: true)
    }
    
    fileprivate func setupContentView() {
        
        view.addSubview(contentView)
        
    }
}

// MARK: - 设置控制器
extension EssenceViewController {
    func setupChildViewControllers() {
        for i in 0..<5 {
            let vc = EssenceContentViewController()
            switch i {
            case 0:
                vc.type = .all
            case 1:
                vc.type = .video
            case 2:
                vc.type = .voice
            case 3:
                vc.type = .picture
            case 4:
                vc.type = .word
            default:
                vc.type = .all
            }
            addChildViewController(vc)
        }
    }
}
extension EssenceViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        let index = scrollView.contentOffset.x / scrollView.frame.width
        clickTitleView(view.viewWithTag(100 + Int(index)) as! UIButton)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.width
        let vc = childViewControllers[Int(index)]
        vc.view.frame = CGRect(x: index * contentView.frame.width, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        contentView.addSubview(vc.view)
    }
}
