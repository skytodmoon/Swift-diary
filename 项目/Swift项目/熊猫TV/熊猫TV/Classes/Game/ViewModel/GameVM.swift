//
//  GameVM.swift
//  熊猫TV
//
//  Created by 金亮齐 on 2017/12/27.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

//http://api.m.panda.tv/index.php?method=category.list&type=game&__version=1.1.7.1305&__plat=ios&__channel=appstore

import UIKit

class GameVM: NSObject {
    
    lazy var gameArray: [GameModel] = [GameModel]()
    func loadGameData(finishedCallback : @escaping () -> ()) {
        NetworkTool.request(type: .GET, urlString: "http://api.m.panda.tv/index.php", paramters: ["method":"category.list", "type":"game", "__version":"1.1.7.1305", "__plat":"ios", "__channel":"appstore"]) { (result) in
            guard let resultDict = result as? [String: NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            for dict in dataArray {
                self.gameArray.append(GameModel(dict: dict))
            }
        }
    }
}

