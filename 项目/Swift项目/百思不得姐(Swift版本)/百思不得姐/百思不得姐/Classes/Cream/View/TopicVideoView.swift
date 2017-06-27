//
//  TopicVideoView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class TopicVideoView: UIView {

    @IBOutlet weak var platCountLabel: UILabel!
    @IBOutlet weak var timeLengthLabel: UILabel!
    @IBOutlet weak var bgView: UIImageView!
    
    
    class func videoView() -> TopicVideoView {
        return NSBundle.mainBundle().loadNibNamed("TopicVideoView", owner: nil, options: nil)[0] as! TopicVideoView
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        autoresizingMask = .None
    }
    
    
    // MARK: - event response
    @IBAction func showPicture(sender: UITapGestureRecognizer) {
        
        let pc = PictureController.init()
        pc.topic = self.topic
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(pc, animated: true, completion:nil)
        
    }
    
    // MARK: - setter
    var topic:Topic?{
        didSet{
            
            self.bgView.kf_setImageWithURL(NSURL.init(string: topic!.large_image)!)
            // 人数
            self.platCountLabel.text = NSString.init(format: "%d播放",topic!.playcount) as String
            // 时长
            let minute = topic!.videotime / 60
            let second = topic!.videotime % 60
            self.timeLengthLabel.text = NSString.init(format: "%02d:%02d",minute,second) as String
            
        }
    }
    
}
