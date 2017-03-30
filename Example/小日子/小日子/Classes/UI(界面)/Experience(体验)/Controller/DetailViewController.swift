//
//  DetailViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
/// 详情ViewController顶部图片的高度
public let DetailViewController_TopImageView_Height: CGFloat = 225

class DetailViewController: UIViewController,UIActionSheetDelegate {
    
    // 优化性能,防止重复设置
    private var showBlackImage: Bool = false
    private var htmlNewString: NSMutableString?
    private let scrollShowNavH: CGFloat = DetailViewController_TopImageView_Height - NavigationH
    private let imageW: CGFloat = AppWidth - 23.0
    private var signUpBtn: UIButton!
    private var isLoadFinish = false
    private var isAddBottomView = false
    private var loadFinishScrollHeihgt: CGFloat = 0
    private lazy var bottomViews: [ExploreBottomView] = [ExploreBottomView]()
    private lazy var shareView: ShareView = ShareView.shareViewFromXib()
    private lazy var backBtn: UIButton = UIButton()
    private lazy var likeBtn: UIButton = UIButton()
    private lazy var sharedBtn: UIButton = UIButton()
    private lazy var webView: UIWebView = ExperienceWebView(frame: MainBounds, webViewDelegate: self, webViewScrollViewDelegate: self)
    
    
    private lazy var topImageView: UIImageView = {
        let image = UIImageView(frame: CGRectMake(0, 0, AppWidth, DetailViewController_TopImageView_Height))
        image.image = UIImage(named: "quesheng")
        image.contentMode = UIViewContentMode.ScaleToFill
        return image
    }()
    
    private lazy var phoneActionSheet: UIActionSheet? = {
        let action = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: self.model!.telephone!)
        return action
    }()
    
    private lazy var customNav: UIView = {
        let customNav = UIView(frame: CGRectMake(0, 0, AppWidth, NavigationH))
        customNav.backgroundColor = UIColor.whiteColor()
        customNav.alpha = 0.0
        return customNav
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
