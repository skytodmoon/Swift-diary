//
//  LeadpageViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

public let SD_ShowMianTabbarController_Notification = "SD_Show_MianTabbarController_Notification"

class LeadpageViewController: UIViewController {
    
    private let backgroundImage = UIImageView(frame: MainBounds)
    private let startBtn: NoHighlightButton = NoHighlightButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        var imageName: String?
        
        switch AppWidth {
        case 375: imageName = NSBundle.mainBundle().pathForResource("fourpage-375w-667h@2x.jpg", ofType: nil)
        case 414: imageName = NSBundle.mainBundle().pathForResource("fourpage-414w-736h@3x.jpg", ofType: nil)
        case 568: imageName = NSBundle.mainBundle().pathForResource("fourpage-568h@2x.jpg", ofType: nil)
        default: imageName = NSBundle.mainBundle().pathForResource("fourpage@2x.jpg", ofType: nil)
            
        }
        
        backgroundImage.image = UIImage(contentsOfFile: imageName!)
        view.addSubview(backgroundImage)
        
        startBtn.setBackgroundImage(UIImage(named: "into_home"), forState: .Normal)
        startBtn.setTitle("开始小日子", forState: UIControlState.Normal)
        startBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        startBtn.frame = CGRect(x: (AppWidth - 210) * 0.5, y: AppHeight - 120, width: 210, height: 45)
        startBtn.addTarget(self, action: #selector(LeadpageViewController.showMainTabbar), forControlEvents: .TouchUpInside)
        view.addSubview(startBtn)
        // Do any additional setup after loading the view.
    }
    
    func showMainTabbar() {
        NSNotificationCenter.defaultCenter().postNotificationName(SD_ShowMianTabbarController_Notification, object: nil)
    }


}
