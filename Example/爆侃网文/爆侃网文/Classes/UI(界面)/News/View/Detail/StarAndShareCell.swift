//
//  StarAndShareCell.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

protocol StarAndShareCellDelegate {
    func didTappedQQButton(button: UIButton)
    func didTappedWeixinButton(button: UIButton)
    func didTappedFriendCircleButton(button: UIButton)
}

class StarAndShareCell: UITableViewCell {

    @IBOutlet weak var qqButton: UIButton!
    @IBOutlet weak var weixinButton: UIButton!
    @IBOutlet weak var friendCircleButton: UIButton!
    var delegate: StarAndShareCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareButton(qqButton)
        prepareButton(weixinButton)
        prepareButton(friendCircleButton)
        
        // WX
        if WXApi.isWXAppInstalled() && WXApi.isWXAppSupportApi() {
            weixinButton.hidden = false
            friendCircleButton.hidden = false
        } else {
            weixinButton.hidden = true
            friendCircleButton.hidden = true
        }
        
        // QQ
        if QQApiInterface.isQQInstalled() && QQApiInterface.isQQSupportApi() {
            qqButton.hidden = false
        } else {
            qqButton.hidden = true
        }
    }
    
    private func prepareButton(button: UIButton) {
        button.layer.cornerRadius = 17
        button.layer.borderColor = UIColor(white: 0.6, alpha: 0.4).CGColor
        button.layer.borderWidth = 0.3
    }
    
    @IBAction func didTappedQQButton(sender: UIButton) {
        delegate?.didTappedQQButton(sender)
    }
    
    @IBAction func didTappedWeixinButton(sender: UIButton) {
        delegate?.didTappedWeixinButton(sender)
    }
    
    @IBAction func didTappedFriendCircleButton(sender: UIButton) {
        delegate?.didTappedFriendCircleButton(sender)
    }

}
