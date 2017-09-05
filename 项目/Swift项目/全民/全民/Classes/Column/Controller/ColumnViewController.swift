//
//  ColumnViewController.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ColumnViewController: UIViewController {
    
    
    fileprivate lazy var ColumnArray = [ColumnModel]()
    fileprivate lazy var columnVM: ColumnVM = ColumnVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        requestData()
        // Do any additional setup after loading the view.
    }


}
extension ColumnViewController {
    // MARK: - 设置UI内容
    fileprivate func setupUI() {
       
    }
    // MARK: - 发送网络请求
    fileprivate func requestData () {
        columnVM.loadColumnData {
            
        }
    }
}
