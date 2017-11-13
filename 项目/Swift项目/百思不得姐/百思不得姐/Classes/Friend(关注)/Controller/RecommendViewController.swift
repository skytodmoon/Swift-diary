//
//  RecommendViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class RecommendViewController: UIViewController {
    
    let categroyIdentifier = "categroy"
    
    let userIdentifier = "user"
    
    
    @IBOutlet weak var categroyTableView: UITableView!
    
    @IBOutlet weak var userTableView: UITableView!
    
    
    
    var parameters_record = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
