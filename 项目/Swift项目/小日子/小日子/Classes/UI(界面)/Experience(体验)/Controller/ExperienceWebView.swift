//
//  ExperienceWebView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ExperienceWebView: UIWebView {

    init(frame: CGRect, webViewDelegate: UIWebViewDelegate?, webViewScrollViewDelegate: UIScrollViewDelegate?) {
        super.init(frame: frame)
        
        let contentH: CGFloat = DetailViewController_TopImageView_Height - 20
        scrollView.contentInset = UIEdgeInsets(top:  contentH, left: 0, bottom: 49, right: 0)
        
        scrollView.showsHorizontalScrollIndicator = false
        delegate = webViewDelegate
        scrollView.delegate = webViewScrollViewDelegate
        backgroundColor = theme.SDWebViewBacagroundColor
        scrollView.contentSize.width = AppWidth
        paginationBreakingMode = UIWebPaginationBreakingMode.Column
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
