//
//  RecommendTagsViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Alamofire

class RecommendTagsViewController: UITableViewController {

    fileprivate let cellIdentifier = "tags"
    fileprivate var tags = [RecommendTags]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

}

extension RecommendTagsViewController {
    
    fileprivate func setupUI(){
        tableView.register(UINib.init(nibName: "RecommendTagsCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 220.0 / 255, green: 220.0 / 255, blue: 220.0 / 255, alpha: 1)
    }
    fileprivate func loadData(){
        let parameters = ["a":"tag_recommend", "c": "topic", "action": "sub"]
        
        Alamofire.request("http://api.budejie.com/api/api_open.php", method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                guard let datas = value as? [[String: Any]] else {
                    return
                }
                for dict in datas {
                    let tag = RecommendTags(dict: dict)
                    self.tags.append(tag)
                }
                self.tableView.reloadData()
            case .failure(let error):
                print("Tags response error = \(error)")
            }
        }
    }
}

extension RecommendTagsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RecommendTagsCell
        cell.setRecommendTags(tags[indexPath.row])
        return cell
    }
}
