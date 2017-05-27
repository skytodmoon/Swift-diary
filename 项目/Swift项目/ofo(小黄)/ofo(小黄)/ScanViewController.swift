//
//  ScanViewController.swift
//  ofo(小黄)
//
//  Created by 金亮齐 on 2017/5/26.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import swiftScan

class ScanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "扫码用车"
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
