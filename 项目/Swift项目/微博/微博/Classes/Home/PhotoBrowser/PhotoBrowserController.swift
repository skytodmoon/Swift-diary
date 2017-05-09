//
//  PhotoBrowserController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


private let PhotoBrowserCellReuseIdentifier = "PhotoBrowserCellReuseIdentifier"

class PhotoBrowserController: UIViewController {
    
    var currentIndex: Int?
    var pictureURLs: [NSURL]?
    init(index: Int, urls: [NSURL])
    {
        currentIndex = index
        pictureURLs = urls
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setupUI()
    }
    
    private func setupUI(){
        
    }
}
