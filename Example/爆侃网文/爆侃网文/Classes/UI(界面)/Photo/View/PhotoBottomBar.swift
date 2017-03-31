//
//  PhotoBottomBar.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

protocol PhotoBottomBarDelegate {
    func didTappedBackButton(button: UIButton)
    func didTappedEditButton(button: UIButton)
    func didTappedCommentButton(button: UIButton)
    func didTappedCollectButton(button: UIButton)
    func didTappedShareButton(button: UIButton)
}


class PhotoBottomBar: UIView {

    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var collectionButton: UIButton!
    
    var delegate: PhotoBottomBarDelegate?
    
    @IBAction func didTappedBackButton(button: UIButton) {
        delegate?.didTappedBackButton(button)
    }
    
    @IBAction func didTappedEditButton(button: UIButton) {
        delegate?.didTappedEditButton(button)
    }
    
    @IBAction func didTappedCommentButton(button: UIButton) {
        delegate?.didTappedCommentButton(button)
    }
    
    @IBAction func didTappedCollectButton(button: UIButton) {
        delegate?.didTappedCollectButton(button)
    }
    
    @IBAction func didTappedShareButton(button: UIButton) {
        delegate?.didTappedShareButton(button)
    }


}
