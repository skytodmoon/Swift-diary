//
//  ComicCHead.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/19.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

typealias ComicCHeadMoreActionClosure = ()->Void

protocol ComicCHeadDelegate: class {
    func comicCHead(_ comicCHead: ComicCHead, moreAction button: UIButton)
}

class ComicCHead: BaseCollectionReusableView {
    
    weak var delegate: ComicCHeadDelegate?
    
    private var moreActionClosure: ComicCHeadMoreActionClosure?
    
    lazy var iconView: UIImageView = {
        return UIImageView()
    }()
    
    lazy var moreIcon: UIImageView = {
        let iw = UIImageView()
        iw.image = UIImage(named: "boutique_item_showmore_Normal")
        iw.contentMode = .scaleAspectFit
        return iw
    }()
    
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.font = UIFont.boldSystemFont(ofSize: 16)
        tl.textColor = UIColor.black
        return tl
    }()
    
    lazy var moreButton: UIButton = {
        let mn = UIButton(type: .system)
        mn.setTitle("更多", for: .normal)
        mn.setTitleColor(UIColor.gray, for: .normal)
        mn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        mn.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
        return mn
    }()
    
    @objc func moreAction(button: UIButton) {
        delegate?.comicCHead(self, moreAction: button)
        
        guard let closure = moreActionClosure else { return }
        closure()
    }
    
    func moreActionClosure(_ closure: ComicCHeadMoreActionClosure?) {
        moreActionClosure = closure
    }
    
    override func configUI() {
        
        addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(0)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(iconView.snp.right).offset(0)
            $0.centerY.height.equalTo(iconView)
            $0.width.equalTo(200)
        }
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().offset(-25)
            $0.width.equalTo(40)
        }
        
        addSubview(moreIcon)
        moreIcon.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(15)
        }
    }
}

