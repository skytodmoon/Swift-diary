//
//  ContentVideo.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Kingfisher

class ContentVideo: UIView {
    
    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var playCountLabel: UILabel!
    
    @IBOutlet weak var videoTimeLabel: UILabel!
    
    @IBOutlet weak var palyButton: UIButton!
    
    
    
    static public func contentVideo() -> ContentVideo {
        return Bundle.main.loadNibNamed("ContentVideo", owner: nil, options: nil)?.last as! ContentVideo
    }
    
    public func setupView(withContent content: Content) {
        
        let url = URL(string: content.large_image)
        
        pictureView.kf.setImage(with: url!)
        
        playCountLabel.text = "\(content.playcount)播放"
        
        let min = content.videotime / 60
        
        let second = content.videotime % 60
        
        videoTimeLabel.text = "\(min):\(second)"
        
        
    }
}
