//
//  ExploreViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

public let SD_RefreshImage_Height: CGFloat = 40
public let SD_RefreshImage_Width: CGFloat = 35

class ExploreViewController: MainViewController,DoubleTextViewDelegate {
    
    private var backgroundScrollView: UIScrollView!
    private var doubleTextView: DoubleTextView!
    private var everyDays: EveryDays?
    private var albumTableView: MainTableView!
    private var dayTableView: MainTableView!
    private var themes: ThemeModels?
    private var events: EveryDays?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
