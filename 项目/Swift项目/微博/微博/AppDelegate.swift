//
//  AppDelegate.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftTheme

//MARK: - 通知
let SwitchRootViewControllerKey = "SwitchRootViewControllerKey"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    fileprivate lazy var main: MainViewController = MainViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.switchRootViewController(notify:)), name: NSNotification.Name(rawValue: SwitchRootViewControllerKey), object: nil)
        // Override point for customization after application launch.
        //MARK: - 同意设置颜色
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITabBar.appearance().tintColor = UIColor.orange
        ThemeManager.setTheme(plistName: UserDefaults.standard.bool(forKey: isNight) ? "night_theme" : "default_theme", path: .mainBundle)
        
        //MARK: - 设置主窗口
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        //MARK: - 根控制器
        window?.rootViewController = defaultContoller()
        window?.makeKeyAndVisible()
        return true
    }
    
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - 通知中心，判断时候进入引导页
    func switchRootViewController(notify: NSNotification){
        if notify.object as! Bool
        {
            window?.rootViewController = MainViewController()
        }else
        {
            window?.rootViewController = WelcomeViewController()
        }
    }
    //MARK: - 用户登入之后进入引导页
    private func defaultContoller() ->UIViewController
    {
        if UserAccount.userLogin(){
            return WelcomeViewController()
        }
        return MainViewController()
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

