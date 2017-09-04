//
//  Common.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import AdSupport


enum CellType: Int {
    case normalCell = 0
    case userCell = 32
    case relationCell = 50
}


/// 屏幕的宽
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let screenHeight = UIScreen.main.bounds.height

/// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
let IID: String = "5034850950"
/// iid 和 device_id 好像是绑定到一起的，不对应的话获取不到数据
let device_id: String = "6096495334"

let app_name = "news_article"

let channel = "App%20Store"

let device_platform = "iphone"
/// 当前时间
let date = Date()
let currentTimeInterval = UInt64(date.timeIntervalSince1970 * 1000)

let resolution = "\(screenWidth * 2)*\(screenHeight * 2)"
/// idfv
let idfv = UIDevice.current.identifierForVendor?.uuidString
/// 版本号
let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
/// 系统版本号
let systemVersion = UIDevice.current.systemVersion
/// idfa
let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString

/// 服务器地址
let BASE_URL = "https://is.snssdk.com/"

// 左右间距
let kMargin:CGFloat = 15.0
// 导航栏高度
let kNavBarHeight: CGFloat = 64.0
// 导航栏高度
let kTabBarHeight: CGFloat = 49.0
/// 首页新闻间距
let khomePageTitleHeight: CGFloat = 40.0
/// 首页新闻间距
let kHomeMargin: CGFloat = 15.0
/// 微头条界面 头部视图 的高度
let kWeiTouTiaoHeaderHieght: CGFloat = 45
/// 我的界面 头部视图 的高度
let kMineHeaderViewHieght: CGFloat = screenHeight * 0.38
/// 关注详情界面 头部视图 的高度
var kConcernHeaderViewHieght: CGFloat = 330


/// iPhone 5
let isIPhone5 = screenHeight == 568 ? true : false
/// iPhone 6
let isIPhone6 = screenHeight == 667 ? true : false
/// iPhone 6P
let isIPhone6P = screenHeight == 736 ? true : false

let isNight = "isNight"

let TabBarDidSelectedNotification = "TabBarDidSelectedNotification"


extension UIView{
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    
    var centerX:CGFloat{
        get{
            return self.frame.midX
        }
        set{
            self.frame.origin.x = newValue - self.frame.size.width * 0.5
        }
    }
    
    var centerY:CGFloat{
        get{
            return self.frame.midY
        }
        set{
            self.frame.origin.y = newValue - self.frame.size.height * 0.5
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    
    var size:CGSize{
        get{
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    func isShowingOnKeyWindow() -> Bool{
        let window = UIApplication.shared.keyWindow
        
        let newFrame = self.superview!.convert(self.frame, to: window)
        let intersects = newFrame.intersects((window?.frame)!)
        
        return !self.isHidden && self.alpha > 0.01 && intersects
    }
    
}

class Common:NSObject{
    /**创建一个barButtonItem*/
    class func itemWithImage(image:UIImage,highlightImage:UIImage,target:UIViewController,action:Selector) -> UIBarButtonItem{
        
        let button = UIButton.init()
        
        button.setBackgroundImage(image, for: .normal)
        button.setBackgroundImage(highlightImage, for: .highlighted)
        
        button.sizeToFit()
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem.init(customView: button)
        
    }
}
