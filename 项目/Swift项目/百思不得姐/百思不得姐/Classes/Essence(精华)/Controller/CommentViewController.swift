//
//  CommentViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import MJExtension

class CommentViewController: UIViewController {
    
    
    /// tableView
    @IBOutlet weak var tableView: UITableView!
    
    /// 底部View的约束
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    /// 数据模型
    var content:Content!
    
    /// 热门评论
    var hotComments: [Comment] = [Comment]()
    
    /// 最新评论
    var newComments: [Comment] = [Comment]()
    
    /// 当前的页码
    var page: Int = 1
    let footView: RefreshFooterView = RefreshFooterView.footerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBasic()
        
        setupHeaderView()
        
        setupRefresh()
        
    }
    
    private func setupBasic() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeViewFrame(_:)), name: NSNotification.Name.init("UIKeyboardWillChangeFrameNotification"), object: nil)
        
        
        // FIX ME: - iOS11 不需要这两句 自动计算cell的高度
        //        tableView.estimatedRowHeight = 44
        //        tableView.rowHeight = UITableViewAutomaticDimension
        
        // 注册headerview和cell
        tableView.register(HeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderFooterView.headerViewIdentifier)
        
        tableView.register(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: CommentCell.commentCellIdentifier)
    }
    
    @objc private func changeViewFrame(_ notoficaion: Notification) {
        
        // 显示或者隐藏完毕的frame
        let frame = notoficaion.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        let constant = screenHeight - frame.origin.y
        // 修改底部约束
        viewBottomConstraint.constant = (screenHeight == iPhoneXHeight) ? (constant - iPhoneXBottomHeight) : constant
        // 动画时间
        let duration = notoficaion.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupHeaderView() {
        
        let cell = Bundle.main.loadNibNamed("ContentCell", owner: nil, options: nil)?.last as! ContentCell
        cell.content = content
        cell.content?.cellHeight
        cell.setupUI()
        let frame = cell.frame
        let x = frame.origin.x
        let y = frame.origin.y
        let w = frame.width
        let h = content.cellHeight
        cell.frame = CGRect(x: x, y: y, width: w, height: h)
        
        tableView.tableHeaderView = cell
        
    }
    
    private func setupRefresh() {
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        // 自动改变透明度
        tableView.mj_header.isAutomaticallyChangeAlpha = true
        tableView.mj_header.beginRefreshing()
        
        tableView.tableFooterView = footView
        footView.delegate = self
        footView.finishLoadData()
        footView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CommentViewController: UITableViewDataSource {
    
    fileprivate func commentsInSection(_ section: Int) -> [Comment] {
        if section == 0 {
            return hotComments.count > 0 ? hotComments : newComments
        }
        return newComments
    }
    
    fileprivate func commentInIndexPath(_ indexPath: IndexPath) -> Comment {
        return commentsInSection(indexPath.section)[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hotComments.count > 0 {
            if section == 0 {return hotComments.count}
            return newComments.count
        }
        if newComments.count > 0 { return newComments.count }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if hotComments.count > 0 { return 2 }
        if newComments.count > 0 { return 1 }
        return 0
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if hotComments.count > 0 {
    //            if section == 0 {return "最热"}
    //            return "最新"
    //        }
    //        if newComments.count > 0 { return "最新" }
    //        return ""
    //    }
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CommentCell.commentCell(tableView)
        cell.setupUI(commentInIndexPath(indexPath))
        return cell
    }
}

extension CommentViewController: UITableViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(false)
    }
    
    // 使用循环引用的HearderView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = HeaderFooterView.hearderFooterView(tableView)
        if hotComments.count > 0 {
            if section == 0 {
                view.titleLabel.text = "最热"
            }else {
                view.titleLabel.text = "最新"
            }
        } else {
            if newComments.count > 0 { view.titleLabel.text = "最新" }
        }
        //        view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 30)
        return view
    }
    
    // 改变headerview的高度
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 100
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(UIPasteboard.general.string ?? "nil sb")
        
        let menu = UIMenuController.shared
        if menu.isMenuVisible {
            menu.setMenuVisible(false, animated: true)
            return
        }
        let cell = tableView.cellForRow(at: indexPath) as! CommentCell
        cell.becomeFirstResponder()
        
        let copyItem = UIMenuItem(title: "复制", action: #selector(copyClick(_:)))
        let dingItem = UIMenuItem(title: "顶", action: #selector(dingClick(_:)))
        let reportItem = UIMenuItem(title: "举报", action: #selector(reportClick(_:)))
        menu.menuItems = [copyItem, dingItem, reportItem]
        
        let rect = CGRect(x: 0, y: cell.frame.height / 2, width: cell.frame.width, height: cell.frame.height)
        // 设置显示的位置 区域
        menu.setTargetRect(rect, in: cell)
        menu.setMenuVisible(true, animated: true)
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        UIMenuController.shared.setMenuVisible(false, animated: true)
    }
    @objc private func copyClick(_ menu: UIMenuController) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let text = commentInIndexPath(indexPath).content
        
        let paste = UIPasteboard.general
        
        paste.string = text
        
    }
    @objc private func dingClick(_ menu: UIMenuController) {
        
    }
    @objc private func reportClick(_ menu: UIMenuController) {
        
    }
    
    
}
extension CommentViewController: RefreshFooterViewDelegate {
    
    func loadMoreData(_ footerView: RefreshFooterView) {
        
        let url = URL(string: "http://api.budejie.com/api/api_open.php")
        
        let cmt = self.newComments.last
        
        let page = self.page + 1
        
        let parmeters = ["a": "dataList",
                         "c": "comment",
                         "data_id": content.ID,
                         "page": "\(page)",
            "lastcid": (cmt?.id ?? "")]
        
        Alamofire.request(url!, method: .get, parameters: parmeters).responseJSON{ (response) in
            
            switch response.result {
            case let .success(value):
                guard let data = value as? [String : Any] else{
                    return
                }
                
                if let hotData = data["hot"] as? [Any] {
                    self.hotComments = Comment.mj_objectArray(withKeyValuesArray: hotData) as! [Comment]
                }
                
                if let newData = data["data"] as? [Any] {
                    self.newComments += Comment.mj_objectArray(withKeyValuesArray: newData) as! [Comment]
                }
                
                self.page = page
                
                self.tableView.reloadData()
                
                self.tableView.mj_header.endRefreshing()
                
                guard let total = data["total"] as? Int else {
                    return
                }
                
                if self.newComments.count >= total {
                    self.footView.isHidden = true
                    self.footView.noDataload()
                } else {
                    self.footView.isHidden = false
                    self.footView.finishLoadData()
                }
                
            case let .failure(error):
                print("获取评论报错---\(error)")
            }
        }
    }
    
    @objc fileprivate func loadNewData() {
        let url = URL(string: "http://api.budejie.com/api/api_open.php")
        
        let parmeters = ["a": "dataList",
                         "c": "comment",
                         "data_id": content.ID,
                         "hot": "1"]
        
        Alamofire.request(url!, method: .get, parameters: parmeters).responseJSON{ (response) in
            
            switch response.result {
            case let .success(value):
                guard let data = value as? [String : Any] else{
                    return
                }
                
                if let hotData = data["hot"] as? [Any] {
                    self.hotComments = Comment.mj_objectArray(withKeyValuesArray: hotData) as! [Comment]
                }
                
                if let newData = data["data"] as? [Any] {
                    self.newComments = Comment.mj_objectArray(withKeyValuesArray: newData) as! [Comment]
                }
                
                self.page = 1
                
                self.tableView.reloadData()
                
                self.tableView.mj_header.endRefreshing()
                
                guard let total = data["total"] as? Int else {
                    return
                }
                
                if self.newComments.count >= total {
                    self.footView.isHidden = true
                    self.footView.noDataload()
                } else {
                    self.footView.isHidden = false
                    self.footView.finishLoadData()
                }
                
            case let .failure(error):
                print("获取评论报错---\(error)")
            }
            
            
        }
        
    }
}

