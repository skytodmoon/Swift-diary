//
//  Theme.swift
//  爱鲜蜂(Swift)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

// MARK: - 全局常用属性
public let NavigationH: CGFloat = 64
public let ScreenWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let ScreenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let ScreenBounds: CGRect = UIScreen.mainScreen().bounds
public let ShopCarRedDotAnimationDuration: NSTimeInterval = 0.2
public let NavigationBarWhiteBackgroundColor = UIColor.colorWithCustom(249, g: 250, b: 253)
// MARK: - Home 属性
public let HotViewMargin: CGFloat = 10
public let HomeCollectionViewCellMargin: CGFloat = 10
public let HomeCollectionTextFont = UIFont.systemFontOfSize(14)
public let HomeCollectionCellAnimationDuration: NSTimeInterval = 1.0
// MARK: - 通知
// MARK: - 首页headView高度改变
public let HomeTableHeadViewHeightDidChange = "HomeTableHeadViewHeightDidChange"
// MARK: - 首页商品库存不足
public let HomeGoodsInventoryProblem = "HomeGoodsInventoryProblem"
public let GuideViewControllerDidFinish = "GuideViewControllerDidFinish"
// MARK: - 广告页通知
public let ADImageLoadSecussed = "ADImageLoadSecussed"
public let ADImageLoadFail = "ADImageLoadFail"
// MARK: - Mine属性
public let CouponViewControllerMargin: CGFloat = 20
// MARK: - HTMLURL
// MARK: - 优惠劵使用规则
public let CouponUserRuleURLString = "http://m.beequick.cn/show/webview/p/coupon?zchtauth=e33f2ac7BD%252BaUBDzk6f5D9NDsFsoCcna6k%252BQCEmbmFkTbwnA&__v=ios4.7&__d=d14ryS0MFUAhfrQ6rPJ9Gziisg%2F9Cf8CxgkzZw5AkPMbPcbv%2BpM4HpLLlnwAZPd5UyoFAl1XqBjngiP6VNOEbRj226vMzr3D3x9iqPGujDGB5YW%2BZ1jOqs3ZqRF8x1keKl4%3D"
// MARK: - Cache路径
public let CachePath: String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!
// MARK: - AuthorURL
public let GitHubURLString: String = "https://github.com/qijinliang"
public let SinaWeiBoURLString: String = "http://weibo.com/u/5067847990/home?topnav=1&wvr=6"
public let BlogURLString: String = "http://www.jianshu.com/u/ef13bae228f6"
// MARK: - 常用颜色
public let GlobalBackgroundColor = UIColor.colorWithCustom(239, g: 239, b: 239)
public let NavigationYellowColor = UIColor.colorWithCustom(253, g: 212, b: 49)
public let TextGreyColol = UIColor.colorWithCustom(130, g: 130, b: 130)
public let TextBlackColor = UIColor.colorWithCustom(50, g: 50, b: 50)
// MARK: - 购物车管理工具通知
public let ShopCarDidRemoveProductNSNotification = "ShopCarDidRemoveProductNSNotification"
//MARK:  - 购买商品数量发生改变
public let ShopCarBuyProductNumberDidChangeNotification = "ShopCarBuyProductNumberDidChangeNotification"
// MARK: - 购物车商品价格发送改变
public let ShopCarBuyPriceDidChangeNotification = "ShopCarBuyPriceDidChangeNotification"
// MARK: - 购物车ViewController
public let ShopCartRowHeight: CGFloat = 50
// MARK: - 搜索ViewController
public let SearchViewControllerHistorySearchArray = "SearchViewControllerHistorySearchArray"

