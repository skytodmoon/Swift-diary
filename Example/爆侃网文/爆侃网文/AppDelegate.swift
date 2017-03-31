//
//  AppDelegate.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 配置全局样式
        setupGlobalStyle()
        // 配置全局数据
        setupGlobalData()
        // 配置控制器
        setupRootViewController()
        // 配置键盘管理
        setupKeyBoardManager()
        return true
    }
    
    
    /** 全局样式 */
    private func setupGlobalStyle() {
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        ProgressHUD.setupHUD() // 配置HUD
    }
    
    /** 配置全局数据 */
    private func setupGlobalData() {
        // 设置初始正文字体大小
        if NSUserDefaults.standardUserDefaults().integerForKey(CONTENT_FONT_SIZE) == 0 {
            // 字体 14小   16中   18大   20  22   24  共6个等级，可以用枚举列举使用
            NSUserDefaults.standardUserDefaults().setInteger(16, forKey: CONTENT_FONT_SIZE)
        }
        
        // 验证缓存的账号是否有效
        AccountModel.checkUserInfo()
    }
    
    
    /** 根控制器 */
    private func setupRootViewController() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController =  isNewVersion() ? NewFeatureViewController() : TabBarController()
        window?.makeKeyAndVisible()
    }
    
    /** 判断是否是新版本 */
    private func isNewVersion() -> Bool {
        // 获取当前的版本号
        let versionString = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
        print(versionString)
        
        let currentVersion = Double(versionString)!
        
        // 获取到之前的版本号
        let sandboxVersionKey = "sandboxVersionKey"
        let sandboxVersion = NSUserDefaults.standardUserDefaults().doubleForKey(sandboxVersionKey)
        
        // 保存当前版本号
        NSUserDefaults.standardUserDefaults().setDouble(currentVersion, forKey: sandboxVersionKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // 对比
        return currentVersion > sandboxVersion
    }
    
    /** 配置键盘管理者 */
    private func setupKeyBoardManager() {
        IQKeyboardManager.sharedManager().enable = true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

