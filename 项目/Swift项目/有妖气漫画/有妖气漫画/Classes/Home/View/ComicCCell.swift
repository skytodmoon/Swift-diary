//
//  ComicCCell.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/20.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

enum ComicCCellStyle {
    case none
    case withTitle
    case withTitieAndDesc
}

class ComicCCell: BaseCollectionViewCell {
    
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
        clipsToBounds = true
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(25)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(titleLabel.snp.top)
        }
        
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(20)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
    }
    
    var style: ComicCCellStyle = .withTitle {
        didSet {
            switch style {
            case .none:
                titleLabel.snp.updateConstraints{
                    $0.bottom.equalToSuperview().offset(25)
                }
                titleLabel.isHidden = true
                descLabel.isHidden = true
            case .withTitle:
                titleLabel.snp.updateConstraints{
                    $0.bottom.equalToSuperview().offset(-10)
                }
                titleLabel.isHidden = false
                descLabel.isHidden = true
            case .withTitieAndDesc:
                titleLabel.snp.updateConstraints{
                    $0.bottom.equalToSuperview().offset(-25)
                }
                titleLabel.isHidden = false
                descLabel.isHidden = false
            }
        }
    }
    
    
    var model: ComicModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.cover,
                                 placeholder: (bounds.width > bounds.height) ? UIImage(named: "normal_placeholder_h") : UIImage(named: "normal_placeholder_v"))
            titleLabel.text = model.name ?? model.title
            descLabel.text = model.subTitle ?? "更新至\(model.content ?? "0")集"
        }
    }
    
}
