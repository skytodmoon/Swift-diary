//
//  ViewController.swift
//  ofo(小黄)
//
//  Created by 金亮齐 on 2017/5/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        setupUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: - 设置导航栏
    private func setNav(){
    
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(.alwaysOriginal)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if let revealVC = revealViewController() {
            revealVC.rearViewRevealWidth = 280
            navigationItem.leftBarButtonItem?.target = revealVC
            navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }

    private func setupUI(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

