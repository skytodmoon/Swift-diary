//
//  ScrollTopWindow.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ScrollTopWindow: NSObject {
    
    static let shareInstance: ScrollTopWindow = ScrollTopWindow()
    static let scrollToWindow: UIButton = {
        let btn = UIButton(frame: UIApplication.shared.statusBarFrame)
        btn.backgroundColor = UIColor.clear
        btn.isHidden = true
        return btn
    }()
    
    override init() {
        super.init()
        statusBarView().insertSubview(ScrollTopWindow.scrollToWindow, at: 200)
        ScrollTopWindow.scrollToWindow.addTarget(self, action: #selector(ScrollTopWindow.scrollTopWindowclick(_:)), for: UIControlEvents.touchUpInside)
    }
    
    deinit {
        print("MGScrollTopWindow--deinit")
    }
    
    @objc func scrollTopWindowclick(_ btn: UIButton) {
        NSLog("点击了最顶部...");
        if let window = UIApplication.shared.keyWindow {
            self.seekAllScrollViewInView(window)
        }
    }

}

// MARK: - statusBarView
extension ScrollTopWindow {
    func statusBarView() -> UIView {
        var statusBar: UIView?
        let key = "statusBar"
        let object = UIApplication.shared
        
        if object.responds(to: NSSelectorFromString(key)) {
            statusBar = object.value(forKey: key) as? UIView
        }
        return statusBar!
    }
}

// MARK: - show AND hidden
extension ScrollTopWindow {
    func show() {
        ScrollTopWindow.scrollToWindow.isHidden = false
    }
    
    func hide() {
        ScrollTopWindow.scrollToWindow.isHidden = true
    }
}

// MARK: - 点击
extension ScrollTopWindow {
    @objc func scrollTopWindowclick() {
        //        NSLog("点击了最顶部...");
        if let window = UIApplication.shared.keyWindow {
            self.seekAllScrollViewInView(window)
        }
    }
}

// MARK: - 寻找
extension ScrollTopWindow {
    func seekAllScrollViewInView(_ view: UIView) {
        // 递归 这样就可以获得所有的View
        for subView in view.subviews {
            self.seekAllScrollViewInView(subView)
        }

        guard view.isKind(of: UIScrollView.classForCoder()) else {
            return
        }
        
        let scrollView = view as! UIScrollView
        let isShowInWindow = scrollView.intersectsOtherView(nil) && scrollView.window == UIApplication.shared.keyWindow
        if isShowInWindow {
            // 是ScrollView滚动到最前面（包括内边距）
            NotificationCenter.default.post(name: Notification.Name(rawValue: KScrollTopWindowNotification), object: nil, userInfo: nil)
            scrollView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated:true)
        }
        
    }
}
