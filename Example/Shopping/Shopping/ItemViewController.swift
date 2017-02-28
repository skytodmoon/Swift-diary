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
    
    var item: Item?
    
    var itemName: String?
    var brandName: String?
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func isBuy(sender: UIButton){
        if item != nil {
            if item?.isBuy == false {
                item?.isBuy = true
                itemNameLabel.textColor = UIColor.greenColor()
            }else {
                item?.isBuy = false
                itemNameLabel.textColor = UIColor.redColor()
            }
            
            print(item?.description())
        }
    }
    override func viewWillAppear(animated: Bool) {
        if item != nil {
            itemNameLabel.text = item?.itemName
            brandNameLabel.text = item?.brandName
        }
    }

}
