//
//  HeaderFooterView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit


class HeaderFooterView: UITableViewHeaderFooterView {
    
    static let headerViewIdentifier = "headerView"
    
    let titleLabel: UILabel
    
    /// 创建View
    ///
    /// - Parameter tableView: TableView
    /// - Returns: View
    static func hearderFooterView(_ tableView: UITableView) -> HeaderFooterView {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderFooterView.headerViewIdentifier)
        if view == nil {
            return HeaderFooterView(reuseIdentifier: HeaderFooterView.headerViewIdentifier)
        }
        return view as! HeaderFooterView
    }
    /// 初始化方法
    ///
    /// - Parameter reuseIdentifier: ID
    override init(reuseIdentifier: String?) {
        titleLabel = UILabel()
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    /// 设置页面
    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        contentView.backgroundColor = UIColor.color(222, 222, 222, 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

