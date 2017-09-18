//
//  MainNavController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavAppearance()
        
        //全局拖拽手势
        setUpGlobalPanGes()
        // Do any additional setup after loading the view.
    }
    //MARK: - 设置导航栏的颜色
    func setUpNavAppearance () {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18)]
    }
    // MARK: - 拦截Push操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 这里判断是否进入push视图
        if (self.childViewControllers.count > 0) {
            let backBtn = UIButton(type: .custom)
            backBtn.frame = CGRect(x: 0, y: 20, width: 44, height: 44)
            backBtn.setImage(UIImage(named: "icon_left"), for: .normal)
            backBtn.addTarget(self, action:#selector(backClick), for: UIControlEvents.touchUpInside)
            // 设置按钮内容左对齐
            backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
            // 内边距
            backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            // 隐藏要push的控制器的tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc fileprivate func backClick() {
        popViewController(animated: true)
    }

}

// MARK: - 全局拖拽手势
extension MainNavController: UIGestureRecognizerDelegate {
    /// 全局拖拽手势
    func setUpGlobalPanGes() {
        // 1.创建Pan手势
        let target = interactivePopGestureRecognizer?.delegate
        let globalPan = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        globalPan.delegate = self
        self.view.addGestureRecognizer(globalPan)
        
        // 2.禁止系统的手势
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    /// 什么时候支持全屏手势（解决手势和TableView左滑冲突问题）
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.childViewControllers.count != 1 {
            if (gestureRecognizer is UIPanGestureRecognizer) {
                if (self.topViewController != nil) && (self.view.gestureRecognizers!.contains(gestureRecognizer)) {
                    let tPoint: CGPoint = ((gestureRecognizer as? UIPanGestureRecognizer)?.translation(in: gestureRecognizer.view))!
                    if tPoint.x >= 0 {
                        let y: CGFloat = fabs(tPoint.y)
                        let x: CGFloat = fabs(tPoint.x)
                        let af: CGFloat = 30.0 / 180.0 * .pi  // tanf(Float(af))
                        let tf: CGFloat = tan(af)
                        return (y / x) <= tf
                    } else {
                        return false
                    }
                }
            }
            return true
        } else {
            return false
        }
    }
    
    /// 移除全局手势
    func removeGlobalPanGes() {
        for case let ges as UIPanGestureRecognizer in self.view.gestureRecognizers! {
            let i = self.view.gestureRecognizers?.index(of: ges)
            self.view.gestureRecognizers?.remove(at: i!)
            print(ges)
        }
    }
}



