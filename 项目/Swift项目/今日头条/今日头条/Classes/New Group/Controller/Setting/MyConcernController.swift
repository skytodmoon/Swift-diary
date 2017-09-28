//
//  MyConcernController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MyConcernController: UITableViewController {
    
    var myConcerns = [MyConcern]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    }
    
    @objc func rightBarButtonItemClicked() {
        print("点击右导航栏")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myConcerns.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AllConcernsCell.self)) as! AllConcernsCell
        cell.myConcern = myConcerns[indexPath.row]
        return cell
    }

}

extension MyConcernController {
    
    fileprivate func setupUI() {
        navigationItem.title = "关注"
        view.backgroundColor = UIColor.white
        tableView.rowHeight = 68
        tableView.separatorColor = UIColor(r: 240, g: 240, b: 240)
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "follow_title_profile_18x18_"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        tableView.register(UINib(nibName: String(describing: AllConcernsCell.self), bundle: nil), forCellReuseIdentifier: String(describing: AllConcernsCell.self))
        
    }
    
}
