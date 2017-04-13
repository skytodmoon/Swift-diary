//
//  Extension+String.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension String{
    
    /** 将当前字符串拼接到cache目录后面 */
    func cacheDir() -> String{
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!  as NSString
        return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
    }
    /** 将当前字符串拼接到doc目录后面 */
    func docDir() -> String
    {
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!  as NSString
        return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
    }
    /** 将当前字符串拼接到tmp目录后面 */
    func tmpDir() -> String
    {
        let path = NSTemporaryDirectory() as NSString
        return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
    }
    /** 计算文字的尺寸 */
    func getTextRectSize(font:UIFont,size:CGSize) -> CGRect {
        
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect:CGRect = (self as NSString).boundingRectWithSize(size, options: option, attributes: attributes, context: nil)
        //        println("rect:\(rect)");
        return rect;
    }
    
}