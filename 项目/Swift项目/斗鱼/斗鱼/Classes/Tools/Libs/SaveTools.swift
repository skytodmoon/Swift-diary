//
//  SaveTools.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class SaveTools: NSObject {
    
    // MARK: - UserDefaults
    // 存储
    class func mg_SaveToLocal(value: Any, key: String?) {
        UserDefaults.standard.set(value, forKey: key!)
        UserDefaults.standard.synchronize()
    }
    
    
    // 读取
    class func mg_getLocalData(key: String) -> Any {
        return UserDefaults.standard.value(forKey: key)
    }
    
    class func mg_removeLocalData(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    /// 删除NSUserDefaults所有记录
    class func mg_removeAllDataByUserDefaults() {
        // 方法一
        guard let appDomain = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        //        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
    
    // MARK: - NSKeyedArchiver
    // 存储
    class func mg_Archiver(_ object: Any, path: String) {
        NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
    
    // 读取
    class func mg_UnArchiver(path: String) -> Any{
        return NSKeyedUnarchiver.unarchiveObject(withFile: path)
    }
}
