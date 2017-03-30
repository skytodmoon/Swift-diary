//
//  ExperienceModel.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ExperienceModel: NSObject, DictModelProtocol {
    var head: [ExperienceHeadModel]?
    var list: [EventModel]?
    
    static func customClassMapping() -> [String : String]? {
        return ["head" : "\(ExperienceHeadModel.self)", "list" : "\(EventModel.self)"]
    }
    
    class func loadExperienceModel(completion: (data: ExperienceModel?, error: NSError?) -> ()) {
        let path = NSBundle.mainBundle().pathForResource("Experience", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
            
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict, cls: ExperienceModel.self) as? ExperienceModel
            completion(data: data, error: nil)
        }
        
    }
}

class ExperienceHeadModel: NSObject {
    var feel: String?
    var shareURL: String?
    var tag: String?
    var id: Int = -1
    /// imageURL
    var adurl: String?
    var title: String?
    var mobileURL: String?
}
