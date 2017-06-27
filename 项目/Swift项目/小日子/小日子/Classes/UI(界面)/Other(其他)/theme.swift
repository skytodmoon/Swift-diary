//
//  theme.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

public let NavigationH: CGFloat = 64
public let AppWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let AppHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds: CGRect = UIScreen.mainScreen().bounds

struct theme {
    
    /**
     *  APP导航栏BarButtonItem文字的大小
     */
    static let SDNavItemFont: UIFont = UIFont.systemFontOfSize(16)
    /**
     *  APP导航栏titileFont文字的大小
     */
    static let SDNavTitleFont: UIFont = UIFont.systemFontOfSize(18)
    /**
     *  ViewController颜色统一
     */
    static let SDBackgroundColor: UIColor = UIColor.colorWith(255, green: 255, blue: 255, alpha: 1)
    /**
     *  WebView颜色统一
     */
    static let SDWebViewBacagroundColor: UIColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
    /**
     *  自定义分享view的高度
     */
    static let ShareViewHeight: CGFloat = 215
    static let GitHubURL: String = "https://github.com/qijinliang"
    static let JianShuURL: String = "http://www.jianshu.com/u/ef13bae228f6"
    /**
     *  UIApplication.sharedApplication()
     */
    static let appShare = UIApplication.sharedApplication()
    static let sinaURL = "https://github.com/qijinliang"
    /**
     *  cache文件路径
     */
    static let cachesPath: String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!
    
}
