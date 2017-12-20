//
//  DetailViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/18.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    weak var delegate: ComicViewWillEndDraggingDelegate?
    
    var detailStatic: DetailStaticModel?
    var detailRealtime: DetailRealtimeModel?
    var guessLike: GuessLikeModel?
    
    private  lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
//        tw.delegate = self
//        tw.dataSource = self
        tw.backgroundColor = UIColor.orange
        tw.separatorStyle = .none
//        tw.register(cellType: DescriptionTCell.self)
//        tw.register(cellType: OtherWorksTCell.self)
//        tw.register(cellType: TicketTCell.self)
//        tw.register(cellType: GuessLikeTCell.self)
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
