//
//  String+Extension.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation

extension String {
    
    //MARK: - 拼接到cahce目录
    func cacheDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        
        return path.appending((self as NSString).lastPathComponent)
    }
    //MARK: - 拼接到doc目录
    func doDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
    
    //MARK: - 拼接到tmp目录
    func tmpDir() -> String {
        let path = NSTemporaryDirectory() as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
}
