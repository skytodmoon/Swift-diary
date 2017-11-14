//
//  ContentVoice.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Kingfisher
class ContentVoice: UIView {
    
    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var playCountLabel: UILabel!
    
    @IBOutlet weak var voiceTimeLabel: UILabel!
    
    @IBOutlet weak var palyButton: UIButton!
    
    
    static func voiceView() -> ContentVoice {
        return Bundle.main.loadNibNamed("ContentVoice", owner: nil, options: nil)!.last as! ContentVoice
    }
    
    
    public func setupView(_ content: Content) {
        
        let url = URL(string: content.large_image)
        
        pictureView.kf.setImage(with: url!)
        
        playCountLabel.text = "\(content.playcount)播放"
        
        let min = content.voicetime / 60
        
        let second = content.voicetime % 60
        
        voiceTimeLabel.text = "\(min):\(second)"
    }
    
    @IBAction func play(_ sender: UIButton) {
        
    }
    
    
}
