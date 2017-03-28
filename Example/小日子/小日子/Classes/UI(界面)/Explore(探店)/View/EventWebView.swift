//
//  EventWebView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class EventWebView: UIWebView {
    
    init(rect: CGRect, webViewDelegate: UIWebViewDelegate?, webViewScrollViewDelegate: UIScrollViewDelegate?) {
        super.init(frame: rect)
        
        let topImageShopViewHeight: CGFloat = DetailViewController_TopImageView_Height - 20 + EventViewController_ShopView_Height
        scrollView.contentInset = UIEdgeInsets(top: topImageShopViewHeight, left: 0, bottom: 0, right: 0)
        scrollView.setContentOffset(CGPoint(x: 0, y: -topImageShopViewHeight), animated: false)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = webViewScrollViewDelegate
        delegate = webViewDelegate
        backgroundColor = theme.SDWebViewBacagroundColor
        paginationBreakingMode = UIWebPaginationBreakingMode.Column
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
