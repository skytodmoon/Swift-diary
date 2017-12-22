//
//  OtherWorksCCell.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/21.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class OtherWorksCCell: BaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        iw.clipsToBounds = true
        return iw
    }()
    
    private lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.black
        tl.font = UIFont.systemFont(ofSize: 14)
        return tl
    }()
    
    private lazy var descLabel: UILabel = {
        let dl = UILabel()
        dl.textColor = UIColor.gray
        dl.font = UIFont.systemFont(ofSize: 12)
        return dl
    }()
    
    override func configUI() {
        
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(20)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(25)
            $0.bottom.equalTo(descLabel.snp.top)
        }
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(titleLabel.snp.top)
        }
    }
    
    
    var model: OtherWorkModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.coverUrl,
                                 placeholder: (bounds.width > bounds.height) ? UIImage(named: "normal_placeholder_h") : UIImage(named: "normal_placeholder_v"))
            titleLabel.text = model.name
            descLabel.text = "更新至\(model.passChapterNum)话"
        }
    }
    
}


