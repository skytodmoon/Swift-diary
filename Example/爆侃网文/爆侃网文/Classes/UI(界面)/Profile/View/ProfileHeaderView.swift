//
//  ProfileHeaderView.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

protocol ProfileHeaderViewDelegate {
    
    func didTappedAvatarButton()
    func didTappedCollectionButton()
    func didTappedCommentButton()
    func didTappedInfoButton()
}

class ProfileHeaderView: UIView {

    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    var delegate: ProfileHeaderViewDelegate?
    
    @IBAction func didTappedAvatarButton() {
        delegate?.didTappedAvatarButton()
    }
    
    @IBAction func didTappedCollectionButton() {
        delegate?.didTappedCollectionButton()
    }
    
    @IBAction func didTappedCommentButton() {
        delegate?.didTappedCommentButton()
    }
    
    @IBAction func didTappedInfoButton() {
        delegate?.didTappedInfoButton()
    }

}
