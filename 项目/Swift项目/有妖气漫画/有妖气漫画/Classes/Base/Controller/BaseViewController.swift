//
//  BaseViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/12.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Kingfisher
import Reusable

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *){
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }else{
            automaticallyAdjustsScrollViewInsets = false
        }
        configUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    func configUI(){}
    
    func configNavigationBar(){
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
           
        }
    }
}
extension BaseViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
