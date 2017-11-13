//
//  Comment.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class Comment: NSObject {
    var id: String = ""
    var voicetime: Int = 0
    var voiceuri: String = ""
    var content: String = ""
    var like_count = 0
    var user: User!
}
