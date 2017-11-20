//
//  Models.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/20.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    var apps: [App]?
    
        static func samopleAppCategoies() -> [AppCategory]{
    
            let bestNewAppsCategory = AppCategory()
            bestNewAppsCategory.name = "Best New Apps"
    
            var apps = [App]()
    
            let frozenApp = App()
            frozenApp.name = "Disney Build It: Frozen"
            frozenApp.imageName = "frozen"
            frozenApp.price = NSNumber(float: 3.99)
            apps.append(frozenApp)
            bestNewAppsCategory.apps = apps
            return [bestNewAppsCategory]
        }
}

class App: NSObject{

    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}