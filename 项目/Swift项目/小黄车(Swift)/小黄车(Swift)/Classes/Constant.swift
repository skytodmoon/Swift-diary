//
//  Constant.swift
//  小黄车(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

// MARK:- 全局参数
let appid = "1226331064"
let AppScreenBounds = UIScreen.main.bounds
let AppScreenW      = UIScreen.main.bounds.size.width
let AppScreenH      = UIScreen.main.bounds.size.height

/// 状态栏高度20
let statusHeight: CGFloat = 20
/// 导航栏高度64
let navHeight: CGFloat = 64
/// tabBar的高度 50
let tabBarHeight: CGFloat = 50
/// 全局的间距 10
let AppGloabalMargin: CGFloat = 10
/** 导航栏颜色 */
let navBarTintColor  = UIColor.colorWithCustom(r: 83, g: 179, b: 163)

/** 全局字体 */
let App_FONT = "Bauhaus ITC"

// 全局存储的key
/// 存储登录用户信息的路径
let AppUserPath: String = "user.plist".cache()
/// 存储登录用户信息
let AppUserInfoKey: String = "AppUserInfoKey"

/// 是否登录
let isLoginKey: String = "isLoginKey"

let AppGetCompanysKey: String = "AppGetCompanysKey"
/// 记录服务器IP
let AppServeraddressKey = "AppServeraddressKey"
/// 搜索数组的key
let AppSearchViewControllerHistorySearchArray = "AppSearchViewControllerHistorySearchArray"



/// 主窗口代理
let KAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

// iOS在当前屏幕获取第一响应
let AppKeyWindow = UIApplication.shared.keyWindow
let AppFirstResponder = AppKeyWindow?.perform(Selector(("firstResponder")))



// MARK:- 通知
/// 通知中心
let AppNotificationCenter = NotificationCenter.default

/// 侧边栏tableView的点击的通知
let AppSideTableViewCellClickNoti  = "AppSideTableViewCellClickNoti"
/// 侧边栏用户View的点击的通知
let AppSideUserViewClickNoti  = "AppSideUserViewClickNoti"
/// 侧边栏用户tableViewFooterView的点击的通知
let AppSideFooterViewClickClickNoti  = "AppSideFooterViewClickClickNoti"

/** 通知：头部即将消失的的通知 */
let AppWillDisplayHeaderViewNotification = "AppWillDisplayHeaderViewNotification"
/** 通知：头部完全消失的的通知 */
let AppDidEndDisplayingHeaderViewNotification = "AppDidEndDisplayingHeaderViewNotification"

/// 搜索历史记录的点击
let AppSelectHistoryearchClickNoti  = "AppSelectHistoryearchClickNoti"

