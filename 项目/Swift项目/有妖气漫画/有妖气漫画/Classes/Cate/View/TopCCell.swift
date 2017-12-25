//
//  TopCCell.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class TopCCell: BaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFit
        return iw
    }()
    
    override func configUI() {

        layer.masksToBounds = true
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
    var model: TopModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.cover)
        }
    }
}
