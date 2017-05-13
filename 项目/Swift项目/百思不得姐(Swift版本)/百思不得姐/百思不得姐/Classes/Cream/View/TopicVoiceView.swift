//
//  TopicVoiceView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class TopicVoiceView: UIView {

    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bgView: UIImageView!
    
    class func voiceView() -> TopicVoiceView {
        return NSBundle.mainBundle().loadNibNamed("TopicVoiceView", owner: nil, options: nil)[0] as! TopicVoiceView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .None
        
    }
    
    
    @IBAction func showPicture(sender: AnyObject) {
        let pc = PictureController.init()
        pc.topic = self.topic
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(pc, animated: true, completion:nil)
    }
    
    /**  内容的setter方法  */
    var topic:Topic?{
        didSet{
            self.bgView.kf_setImageWithURL(NSURL.init(string: topic!.large_image)!)
            // 人数
            self.peopleLabel.text = NSString.init(format: "%d播放",topic!.playcount) as String
            // 时长
            let minute = topic!.voicetime / 60
            let second = topic!.voicetime % 60
            self.timeLabel.text = NSString.init(format: "%02d:%02d",minute,second) as String
            
        }
    }
    


}
