//
//  UserInfoManager.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class UserInfoManager: NSObject {

    private static let sharedInstance = UserInfoManager()
    var userPosition: CLLocationCoordinate2D?
    private lazy var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        return locationManager
    }()
    
    
    class var sharedUserInfoManager: UserInfoManager {
        return sharedInstance
    }
    
    /// 获取用户位置授权,定位用户当前坐标
    func startUserlocation() {
        locationManager.autoContentAccessingProxy
        locationManager.startUpdatingLocation()
    }
    
}

extension UserInfoManager: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userPos = locations[0] as CLLocation
        userPosition = userPos.coordinate
        //            print("定位定位")
        locationManager.stopUpdatingLocation()
        
    }
    
}
