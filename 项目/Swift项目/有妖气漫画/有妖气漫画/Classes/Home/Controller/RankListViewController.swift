//
//  RankListViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/12.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class RankListViewController: BaseViewController {

    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.green
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
//        tw.delegate = self
//        tw.dataSource = self
//        tw.separatorStyle = .none
//        tw.register(cellType: RankTCell.self)
        tw.Head = RefreshHeader{ self.loadData() }
        tw.empty = EmptyView { self.loadData() }
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    @objc private func loadData() {
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }

}
