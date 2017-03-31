//
//  ClassDetailViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

public let DetailCellHeight: CGFloat = 220

class ClassDetailViewController: UIViewController {
    
    
    private lazy var detailTableView: MainTableView = {
        let tableView = MainTableView(frame: MainBounds, style: .Plain, dataSource: self, delegate: self)
        tableView.rowHeight = DetailCellHeight
        tableView.contentInset = UIEdgeInsetsMake(0, 0, NavigationH, 0)
        tableView.registerNib(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: SD_DetailCell_Identifier)
        return tableView
    }()
    
    var details: DetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
