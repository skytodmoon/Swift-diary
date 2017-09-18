//
//  AppDelegate.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import pop

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //MARK - 自定义属性
    fileprivate lazy var bgView: UIView = {
        let bgView = UIView(frame: UIScreen.main.bounds)
        bgView.backgroundColor = UIColor.white
        return bgView
    }()
    
    fileprivate lazy var scrollView: GuardScrollView = {
        let scrollView = GuardScrollView(frame: UIScreen.main.bounds)
        scrollView.backgroundColor = UIColor.white
        return scrollView
    }()
    
    fileprivate lazy var tabBarVC:TabBarController = TabBarController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            ScrollTopWindow.shareInstance.show()
        }
        
        let isfirst = SaveTools.mg_getLocalData(key: "isFirstOpen") as? String
        if (isfirst?.isEmpty == nil) {
            UIApplication.shared.isStatusBarHidden = true
            showAppGurdView()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.EnterHomeView(_:)), name: NSNotification.Name(rawValue: KEnterHomeViewNotification), object: nil)
        
        return true
    }
    
    deinit {
        print("AppDelegate--deinit")
        NotificationCenter.default.removeObserver(self)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    fileprivate func showAppGurdView() {
        self.window?.addSubview(bgView)
        bgView.addSubview(scrollView)
    }
    func EnterHomeView(_ noti: Notification) {
        // 获取通知传过来的按钮
        let dict = (noti as NSNotification).userInfo as! [String: AnyObject]
        let btn = dict["sender"]
        
        SaveTools.mg_SaveToLocal(value: "false", key:  "isFirstOpen")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(UInt64(2.5) * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: { () -> Void in
            guard let showMenuAnimation = POPSpringAnimation(propertyNamed: kPOPViewAlpha) else { return }
            showMenuAnimation.toValue = (0.0)
            showMenuAnimation.springBounciness = 10.0
            btn!.pop_add(showMenuAnimation,forKey:"hideBtn")
            UIView.animate(withDuration: 1.5, animations: { () -> Void in
                self.bgView.layer.transform = CATransform3DMakeScale(2, 2, 2)
                self.bgView.alpha = 0
            },completion: { (completion) -> Void in
                UIApplication.shared.isStatusBarHidden = false
                self.bgView.removeFromSuperview()
            })
        })
    }

    
}

