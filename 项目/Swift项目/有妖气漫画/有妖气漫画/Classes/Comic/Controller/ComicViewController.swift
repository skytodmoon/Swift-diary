//
//  ComicViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

protocol ComicViewWillEndDraggingDelegate: class {
    func comicWillEndDragging(_ scrollView: UIScrollView)
}

class ComicViewController: BaseViewController {
    
    private var comicid: Int = 0
    
    convenience init(comicid: Int) {
        self.init()
        self.comicid = comicid
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
}
