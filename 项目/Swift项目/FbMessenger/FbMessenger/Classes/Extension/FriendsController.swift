//
//  FriendsController.swift
//  FbMessenger
//
//  Created by 金亮齐 on 2017/11/23.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

extension FriendsController {
    
    func setupData(){
        
        let mark = Friend()
        mark.name = "Mark Zuckeroery"
        mark.profileImageName = "FaceHead"
        
        let message = Message()
        message.friend = mark
        message.text = "Hello my name is Mark. Nice to meet you"
        message.date = NSDate()
        
        
        let steve = Friend()
        steve.name = "Steve Jobs"
        steve.profileImageName = "SteveHeader"
        
        let messageSteve = Message()
        messageSteve.friend = steve
        messageSteve.text = "Apple creates greet ios Devices for world"
        messageSteve.date = NSDate()
        
        messages = [message,messageSteve]
    }
}
