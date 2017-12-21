//
//  UpdateListViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/20.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class UpdateListViewController: BaseViewController {
    
    private var argCon: Int = 0
    private var argName: String?
    private var argValue: Int = 0
    private var page: Int = 1
    
    private var comicList = [ComicModel]()
    private var spinnerName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    convenience init(argCon: Int = 0, argName: String?, argValue: Int = 0) {
        self.init()
        self.argCon = argCon
        self.argName = argName
        self.argValue = argValue
    }
    

}
