//
//  BoutiqueListViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/12.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class BoutiqueListViewController: BaseViewController {
    
    
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.orange
        tw.tableFooterView = UIView()
//        tw.delegate = self
//        tw.dataSource = self
//        tw.register(cellType: UpdateTCell.self)
        tw.Head = RefreshHeader { self.loadData(more: false) }
        tw.Foot = RefreshFooter { self.loadData(more: true) }
        tw.empty = EmptyView { self.loadData(more: false) }
        return tw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(more: false)
    }
    
    @objc private func loadData(more: Bool) {
        
        
    }

    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }
}
