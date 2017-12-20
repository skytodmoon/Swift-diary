//
//  CommentViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/18.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class CommentViewController: BaseViewController {
    
    var detailStatic: DetailStaticModel?
    var commentList: CommentListModel? {
        didSet {
            guard let commentList = commentList?.commentList else { return }
            let viewModelArray = commentList.flatMap { (comment) -> CommentViewModel? in
                return CommentViewModel(model: comment)
            }
            listArray.append(contentsOf: viewModelArray)
        }
    }
    
    private var listArray = [CommentViewModel]()
    
    
    weak var delegate: ComicViewWillEndDraggingDelegate?
    
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.brown
//        tw.delegate = self
//        tw.dataSource = self
//        tw.register(cellType: CommentTCell.self)
//        tw.uFoot = URefreshFooter { self.loadData() }
        return tw
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {$0.edges.equalTo(self.view.usnp.edges) }
    }

}
