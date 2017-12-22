//
//  SpecialViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/20.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class SpecialViewController: BaseViewController {
    
    private var page: Int = 1
    private var argCon: Int = 0
    
    private var specialList = [ComicModel]()
    
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.background
        tw.tableFooterView = UIView()
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: SpecialTCell.self)
        tw.Head = RefreshHeader { self.loadData(more: false) }
        tw.Foot = RefreshFooter { self.loadData(more: true) }
        tw.empty = EmptyView { self.loadData(more: false) }
        return tw
    }()
    
    convenience init(argCon: Int = 0) {
        self.init()
        self.argCon = argCon
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(more: false)
    }
    
    @objc private func loadData(more: Bool) {
        page = (more ? ( page + 1) : 1)
        ApiLoadingProvider.request(Api.special(argCon: argCon, page: page), model: ComicListModel.self) { [weak self] (returnData) in
            
            self?.tableView.Head.endRefreshing()
            if returnData?.hasMore == false {
                self?.tableView.Foot.endRefreshingWithNoMoreData()
            } else {
                self?.tableView.Foot.endRefreshing()
            }
            self?.tableView.empty?.allowShow = true
            
            if !more { self?.specialList.removeAll() }
            self?.specialList.append(contentsOf: returnData?.comics ?? [])
            self?.tableView.reloadData()
            
            
            guard let defaultParameters = returnData?.defaultParameters else { return }
            self?.argCon = defaultParameters.defaultArgCon
        }
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalTo(self.view.usnp.edges) }
    }
    
}

extension SpecialViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SpecialTCell.self)
        cell.model = specialList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = specialList[indexPath.row]
        var html: String?
        if item.specialType == 1 {
            html = "http://www.u17.com/z/zt/appspecial/special_comic_list_v3.html"
        } else if item.specialType == 2{
            html = "http://www.u17.com/z/zt/appspecial/special_comic_list_new.html"
        }
        guard let host = html else { return }
        let path = "special_id=\(item.specialId)&is_comment=\(item.isComment)"
        let url = [host, path].joined(separator: "?")
        let vc = WebViewController(url: url)
        navigationController?.pushViewController(vc, animated: true)
    }
}

