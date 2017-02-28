//
//  Item.swift
//  Shopping
//
//  Created by 金亮齐 on 2017/2/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation

class Item {
    
    var itemName: String = ""
    
    var brandName: String = ""
    
    var isBuy: Bool = false
    
    //指定构造器
    
    init(itemName: String, brandName: String, isBuy: Bool){
        self.itemName = itemName
        self.brandName = brandName
        self.isBuy = isBuy
    }
    
    //便利构造器
    convenience init(itemName: String){
        self.init(itemName: itemName, brandName: "", isBuy: false)
    }
    
    convenience init(itemName: String, brandName: String){
        self.init(itemName: itemName,brandName: brandName,isBuy: false)
    }
    
    func description()->String{
        return "itemName: \(itemName) brandName: \(brandName) isBuy: \(isBuy)"
    }
}
