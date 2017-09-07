//
//  MainViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SWRevealViewController

class MainViewController: SWRevealViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMainView()
        
        view.backgroundColor = UIColor.orange
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
// MARK: - 初始化UI
extension MainViewController {
    
    fileprivate func setUpMainView() {
        self.title = "优点巴士"
        
        let revealController = self.getRevealViewController()
        revealController.rearViewRevealWidth = ScreenW*0.82
        view.addGestureRecognizer(revealController.panGestureRecognizer())
        view.addGestureRecognizer(revealController.tapGestureRecognizer())
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_home_Nav_left").withRenderingMode(.alwaysOriginal), style: .plain, target: revealController, action: #selector(revealController.revealToggle(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_home_Nav_right").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(MainViewController.rightClick))
    }
    
    @objc fileprivate func leftClick() {
        self.revealViewController().revealToggle(nil)
    }
    @objc fileprivate func rightClick(_ btn: UIButton) {
        let messageVC = MessageController()
        navigationController?.pushViewController(messageVC, animated: true)
    }
}
