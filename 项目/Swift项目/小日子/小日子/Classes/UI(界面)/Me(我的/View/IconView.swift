//
//  IconView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class IconView: UIView {
    
    var iconButton: UIButton!
    weak var delegate: IconViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        self.backgroundColor = UIColor.clearColor()
        iconButton = UIButton(type: .Custom)
        iconButton.setImage(UIImage(named: "my"), forState: .Normal)
        iconButton.addTarget(self, action: #selector(IconView.iconBtnClick), forControlEvents: .TouchUpInside)
        iconButton.clipsToBounds = true
        addSubview(iconButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let mrgin: CGFloat = 8
        iconButton.frame = CGRectMake(mrgin, mrgin, self.width - mrgin * 2, self.height - mrgin * 2)
        iconButton.setBackgroundImage(UIImage(named: "white")?.imageClipOvalImage(), forState: .Normal)
    }
    
    override func drawRect(rect: CGRect) {
        let circleWidth: CGFloat = 2
        // 圆角矩形
        let path = UIBezierPath(roundedRect: CGRectMake(circleWidth, circleWidth, rect.size.width - circleWidth * 2, rect.size.width - circleWidth * 2), cornerRadius: rect.size.width)
        path.lineWidth = circleWidth
        UIColor.whiteColor().set()
        path.stroke()
    }
    
    func iconBtnClick() {
        delegate?.iconView(self, didClick: self.iconButton)
    }

}


protocol IconViewDelegate: NSObjectProtocol {
    func iconView(iconView: IconView, didClick iconButton: UIButton)
}
