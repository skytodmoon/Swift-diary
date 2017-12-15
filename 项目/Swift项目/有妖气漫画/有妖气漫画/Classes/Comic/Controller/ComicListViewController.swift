//
//  ComicListViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class ComicListViewController: BaseViewController {
    
    private var argCon: Int = 0
    private var argName: String?
    private var argValue: Int = 0
    private var page: Int = 1
    
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.background
        tw.tableFooterView = UIView()
//        tw.delegate = self
//        tw.dataSource = self
//        tw.register(cellType: ComicTCell.self)
        tw.Head = RefreshHeader { self.loadData(more: false) }
        tw.Foot = RefreshFooter { self.loadData(more: true) }
        tw.empty = EmptyView { self.loadData(more: false) }
        return tw
    }()
    
    private var comicList = [ComicModel]()
    private var spinnerName: String?
    
    convenience init(argCon: Int = 0, argName: String?, argValue: Int = 0) {
        self.init()
        self.argCon = argCon
        self.argName = argName
        self.argValue = argValue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData(more: false)
    }

    @objc private func loadData(more: Bool) {
        page = (more ? ( page + 1) : 1)
        ApiLoadingProvider.request(Api.comicList(argCon: argCon, argName: argName ?? "", argValue: argValue, page: page),
                                   model: ComicListModel.self) { [weak self] (returnData) in
                                    self?.tableView.Head.endRefreshing()
                                    if returnData?.hasMore == false {
                                        self?.tableView.Foot.endRefreshingWithNoMoreData()
                                    } else {
                                        self?.tableView.Foot.endRefreshing()
                                    }
                                    self?.tableView.empty?.allowShow = true
                                    
                                    if !more { self?.comicList.removeAll() }
                                    self?.comicList.append(contentsOf: returnData?.comics ?? [])
                                    self?.tableView.reloadData()
                                    
                                    
                                    guard let defaultParameters = returnData?.defaultParameters else { return }
                                    self?.argCon = defaultParameters.defaultArgCon
                                    self?.spinnerName = defaultParameters.defaultConTagType
        }
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }
}

//extension ComicListViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return comicList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ComicTCell.self)
//        cell.spinnerName = spinnerName
//        cell.indexPath = indexPath
//        cell.model = comicList[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = comicList[indexPath.row]
//        let vc = ComicViewController(comicid: model.comicId)
//        navigationController?.pushViewController(vc, animated: true)
//    }
//}

