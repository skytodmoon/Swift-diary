//
//  SearchTHead.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

typealias SearchTHeadMoreActionClosure = ()->Void

protocol SearchTHeadDelegate: class {
    func searchTHead(_ searchTHead: SearchTHead, moreAction button: UIButton)
}

class SearchTHead: BaseTableViewHeaderFooterView {
    weak var delegate: SearchTHeadDelegate?
    
    private var moreActionClosure: SearchTHeadMoreActionClosure?
    
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = UIColor.gray
        return tl
    }()
    
    lazy var moreButton: UIButton = {
        let mn = UIButton(type: .custom)
        mn.setTitleColor(UIColor.lightGray, for: .normal)
        mn.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
        return mn
    }()
    
    @objc private func moreAction(button: UIButton) {
        delegate?.searchTHead(self, moreAction: button)
        
        guard let closure = moreActionClosure else { return }
        closure()
    }
    
    func moreActionClosure(_ closure: @escaping SearchTHeadMoreActionClosure) {
        moreActionClosure = closure
    }
    
    override func configUI() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        
        contentView.addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview()
            $0.width.equalTo(40)
        }
        
        let line = UIView().then { $0.backgroundColor = UIColor.background }
        contentView.addSubview(line)
        line.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
