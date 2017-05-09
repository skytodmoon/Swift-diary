//
//  HomeViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {
    
    var statuses: [Status]? {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - 判断用户是否登录
        if !userIsLogin {
            visitorView.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "我是醉看红尘这场梦,这是我仿写的新浪微博客户端")
            return;
        }
        setupNav()
        
        //MARK: - 通知代理方法
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.change), name: PopoverAnimatorShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.change), name: PopoverAnimatorDismissNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.presentPhotoBrowserView(_:)), name: StatusPictureViewSelected, object: nil)

        //MARK: - 注册tableviewcell
        tableView.registerClass(StatusNormalTableViewCell.self, forCellReuseIdentifier: StatusTableViewCellIdentifier.NormalCell.rawValue)
        tableView.registerClass(StatusForwardTableViewCell.self, forCellReuseIdentifier: StatusTableViewCellIdentifier.NormalCell.rawValue)
        tableView.separatorStyle = .None
        refreshControl = HomeRefreshControl()
        refreshControl?.addTarget(self, action: #selector(HomeViewController.loadData), forControlEvents: UIControlEvents.ValueChanged)
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func presentPhotoBrowserView(notify: NSNotification){
        
        guard let indexPath = notify.userInfo![StatusPictureViewIndexKey] as? NSIndexPath else
        {
            print("indexPath为空")
            return
        }
        
        guard let urls = notify.userInfo![StatusPictureViewURLsKey] as? [NSURL] else
        {
            print("配图为空")
            return
        }
        
        //MARK: - 创建图片浏览器
        let vc = PhotoBrowserController(index: indexPath.item, urls: urls)
        
        //MARK: - 显示图片浏览器
        presentViewController(vc, animated: true, completion: nil)
        
    }
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: - 设置导航的左右按钮和中间的按钮
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_friendattention", target: self, action: #selector(HomeViewController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_pop", target: self, action: #selector(HomeViewController.rightItemClick))
        //点击中间按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("醉看红尘这场梦", forState: .Normal)
        titleBtn .addTarget(self, action: #selector(HomeViewController.titltBtnClick(_:)), forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    lazy var pullupRefreshFlag:Bool = false

    
    func loadData() {
        
        var since_id = statuses?.first?.id ?? 0
        var max_id = 0
        if pullupRefreshFlag{
            since_id = 0
            max_id = statuses?.last?.id ?? 0
        }
        
        Status.loadStatuses(since_id,max_id: max_id) { (models, error) -> () in
            self.refreshControl?.endRefreshing()
            if error != nil{
                return
            }
            if since_id > 0{
                self.statuses = models! + self.statuses!
                self.showNewStatusCount(models?.count ?? 0)
            }else if max_id > 0{
                self.statuses = self.statuses! + models!
            }else{
                self.statuses = models
            }
        }
    }
    
    private func showNewStatusCount(count : Int)
    {
        if count == 0{
            return;
        }
        newStatusLabel.hidden = false
        newStatusLabel.text = "\(count)条新微博"

        UIView.animateWithDuration(1, animations: { () -> Void in
            self.newStatusLabel.transform = CGAffineTransformMakeTranslation(0, self.newStatusLabel.frame.height)
                }) { (_) -> Void in
                        UIView.animateWithDuration(1, animations: { () -> Void in
                        self.newStatusLabel.transform = CGAffineTransformIdentity
                }, completion: { (_) -> Void in
                    self.newStatusLabel.hidden = true
            })
        }
    }

    func change(){
        let titleBtn = navigationItem.titleView as! TitleButton
        titleBtn.selected = !titleBtn.selected
    }
    
    func titltBtnClick(btn:TitleButton){
        let popoverVC = PopoverViewController()
        popoverVC.transitioningDelegate = popoverAnimator
        popoverVC.modalPresentationStyle = .Custom
        presentViewController(popoverVC, animated: true, completion: nil)
    }
    
    //MARK: - 菜单栏动画
    private lazy var popoverAnimator = PopoverAnimator()
    
    //MARK: - 下拉刷新提醒
    private lazy var newStatusLabel: UILabel = {
        let label = UILabel()
        let height: CGFloat = 44
        label.frame =  CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: height)
        label.backgroundColor = UIColor.orangeColor()
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        self.navigationController?.navigationBar.insertSubview(label, atIndex: 0)
        label.hidden = true
        return label
    }()

    @objc private func leftItemClick (){
        print(#function)
    }
    @objc private func rightItemClick () {
        print(#function)
        print(UserAccount.loadAccount())
    }
    
    var rowCache: [Int: CGFloat] = [Int: CGFloat]()
    
    override func didReceiveMemoryWarning() {
        rowCache.removeAll()
    }
}

//MARK: - 设置TableViewDelegate，TableVideDataSource
extension HomeViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let status = statuses![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(StatusTableViewCellIdentifier.cellID(status), forIndexPath: indexPath) as! StatusTableViewCell
        cell.status = status
        
        let count = statuses?.count ?? 0
        if indexPath.row == (count - 5)
        {
            //MARK: - 滚动即将触底时,加载更多数据
            pullupRefreshFlag = true
            loadData()
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let status = statuses![indexPath.row]
        
        if let height = rowCache[status.id]
        {
            return height
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(StatusTableViewCellIdentifier.cellID(status)) as! StatusTableViewCell
        //MARK: - 拿到对应行的行高
        let rowHeight = cell.rowHeight(status)
        rowCache[status.id] = rowHeight
        return rowHeight
    }

}