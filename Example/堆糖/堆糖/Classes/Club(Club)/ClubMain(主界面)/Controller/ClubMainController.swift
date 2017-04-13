//
//  ClubMainController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ClubMainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavgation()
        
        setupSegmentedControl()
        // Do any additional setup after loading the view.
    }


    func setupNavgation(){
        
        addChildViewController(ClubHotController())
        addChildViewController(ClubClubController())
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "我的话题", titleColor: UIColor.grayColor(), target: self, action: #selector(ClubMainController.rightBarButtonClick))
    }
    func setupSegmentedControl() {
        
        let segmentedArray = ["热门","Club"]
        let segmentedControl =  UISegmentedControl(items: segmentedArray)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.tintColor()
        segmentedControl.addTarget(self, action: #selector(ClubMainController.segmentedControlChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
        navigationItem.titleView = segmentedControl
        segmentedControlChange(segmentedControl)
    }
    
    // MARK: - 事件
    @objc private func segmentedControlChange(segmentedControl:UISegmentedControl) {
        
        let vc = childViewControllers[segmentedControl.selectedSegmentIndex]
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
    }
    
    
    @objc private func rightBarButtonClick(){
        
        navigationController?.pushViewController(MeMainController(), animated: true)
    }
    

}
