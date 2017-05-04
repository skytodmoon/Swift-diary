//
//  AppDelegate.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setKeyWindow()
        
        setAppAppearance()
        
        setShared()
        
        setUserMapInfo()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.showMianViewController), name: SD_ShowMianTabbarController_Notification, object: nil)
        

        // Override point for customization after application launch.
        return true
    }
    
    private func setKeyWindow() {
        window = UIWindow(frame: MainBounds)
        
        window?.rootViewController = showLeadpage()
        
        window?.makeKeyAndVisible()
    }
    
    //MARK: - 引导页设置
    private func showLeadpage() -> UIViewController {
        let versionStr = "CFBundleShortVersionString"
        let cureentVersion = NSBundle.mainBundle().infoDictionary![versionStr] as! String
        let oldVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionStr) as? String) ?? ""
        
        if cureentVersion.compare(oldVersion) == NSComparisonResult.OrderedDescending {
            NSUserDefaults.standardUserDefaults().setObject(cureentVersion, forKey: versionStr)
            NSUserDefaults.standardUserDefaults().synchronize()
            return LeadpageViewController()
        }
        
        return MainTabBarController()
    }
    
    
    //MARK: - 分享设置
    func setAppAppearance() {
        let itemAppearance = UITabBarItem.appearance()
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Selected)
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Normal)
        
        //设置导航栏主题
        let navAppearance = UINavigationBar.appearance()
        // 设置导航titleView字体
        navAppearance.translucent = false
        navAppearance.titleTextAttributes = [NSFontAttributeName : theme.SDNavTitleFont, NSForegroundColorAttributeName : UIColor.blackColor()]
        
        let item = UIBarButtonItem.appearance()
        item.setTitleTextAttributes([NSFontAttributeName : theme.SDNavItemFont, NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
    }
    
    
    func setShared() {
//        UMSocialData.setAppKey(theme.UMSharedAPPKey)
//        //        UMSocialSinaHandler.openSSOWithRedirectURL("http://www.jianshu.com/users/5fe7513c7a57/latest_articles")
//        UMSocialSinaHandler.openSSOWithRedirectURL(nil)
//        UMSocialWechatHandler.setWXAppId("wx485c6ee1758251bd", appSecret: "468ab73eef432f59a2aa5630e340862f", url: theme.JianShuURL)
//        UMSocialConfig.hiddenNotInstallPlatforms([UMShareToWechatSession,UMShareToWechatTimeline])
//    }
//    
//    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
//        return UMSocialSnsService.handleOpenURL(url)
//    }
//    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
//        return UMSocialSnsService.handleOpenURL(url)
    }
    
    
    func setUserMapInfo() {
//        UserInfoManager.sharedUserInfoManager.startUserlocation()
//        MAMapServices.sharedServices().apiKey = theme.GaoDeAPPKey
    }
    
    
    func showMianViewController() {
        let mainTabBarVC = MainTabBarController()
        self.window!.rootViewController = mainTabBarVC
        let nav = mainTabBarVC.viewControllers![0] as? NavigationController
        (nav?.viewControllers[0] as! MainViewController).pushcityView()
    }
    
    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        SDWebImageManager.sharedManager().imageCache.cleanDisk()
        SDWebImageManager.sharedManager().cancelAll()
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

