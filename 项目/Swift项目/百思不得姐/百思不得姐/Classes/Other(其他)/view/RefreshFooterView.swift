//
//  RefreshFooterView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

protocol RefreshFooterViewDelegate: NSObjectProtocol {
    
    func loadMoreData(_ footerView: RefreshFooterView)
}

class RefreshFooterView: UIView {

    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var loadMoreButton: UIButton!
    
    @IBOutlet weak var noDataLabel: UILabel!
    
    public weak var delegate: RefreshFooterViewDelegate?
    
    public class func footerView() -> RefreshFooterView {
        return Bundle.main.loadNibNamed("RefreshFooterView", owner: nil, options: nil)?.last as! RefreshFooterView
    }
    
    @IBAction func clickLoadMoreBUtton(_ sender: UIButton) {
        loadMoreButton.isHidden = true
        loadingView.isHidden = false
        noDataLabel.isHidden = true
        delegate?.loadMoreData(self)
    }
    
    public func finishLoadData() {
        loadMoreButton.isHidden = false
        loadingView.isHidden = true
        noDataLabel.isHidden = true
    }
    public func noDataload() {
        loadMoreButton.isHidden = true
        loadingView.isHidden = true
        noDataLabel.isHidden = false
    }

}
