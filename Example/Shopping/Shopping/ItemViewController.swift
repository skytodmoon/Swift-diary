//
//  ItemViewController.swift
//  Shopping
//
//  Created by 金亮齐 on 2017/2/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    
    var itemName: String?
    var brandName: String?
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        if itemName != nil {
            itemNameLabel.text = itemName
            
        }
        
        if brandName != nil {
            brandNameLabel.text = brandName
        }
    }

}
