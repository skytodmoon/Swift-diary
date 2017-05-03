//
//  CategoryInfoView.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CategoryInfoView: UIView {
    
    var malls : MallsGoods?
        {
        didSet{
            DescLabel.text = malls!.fnDesc
            titleLabel.text = malls!.fnName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup()
    {
        addSubview(DescLabel)
        addSubview(titleLabel)
        addSubview(gotoBtn)
        
        DescLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(20)
            make.top.equalTo(self).offset(12)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(DescLabel)
            make.top.equalTo(DescLabel.snp_bottom).offset(5)
        }
        
        gotoBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-20)
        }
    }
    
    /// 描述信息
    private lazy var DescLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.blackColor()
        label.text = "A SURPRISE"
        return label
    }()
    
    /// 名称
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.blackColor()
        label.text = "华彩和"
        return label
    }()
    
    /// goto图标
    private lazy var gotoBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"goto"), forState: .Normal)
        btn.userInteractionEnabled = false
        return btn
    }()


}
