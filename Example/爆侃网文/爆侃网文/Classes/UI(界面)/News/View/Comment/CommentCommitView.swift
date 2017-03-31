//
//  CommentCommitView.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

protocol CommentCommitViewDelegate {
    func didTappedSendButtonWithMessage(message: String) -> Void
}

class CommentCommitView: UIView,UITextViewDelegate {

    var delegate: CommentCommitViewDelegate?
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    let bgView = UIView(frame: SCREEN_BOUNDS)
    
    /**
     取消按钮点击
     */
    @IBAction func didTappedCancelButton(sender: UIButton) {
        dismiss()
    }
    
    /**
     发送按钮点击
     */
    @IBAction func didTappedSendButton(sender: UIButton) {
        delegate?.didTappedSendButtonWithMessage(textView.text)
        dismiss()
    }
    
    @objc private func didTappedBgView(tap: UITapGestureRecognizer) {
        dismiss()
    }
    
    /**
     弹出评论视图
     */
    func show() -> Void {
        
        bgView.backgroundColor = UIColor(white: 0, alpha: 0)
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedBgView(_:))))
        UIApplication.sharedApplication().keyWindow?.addSubview(bgView)
        
        frame = CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        textView.becomeFirstResponder()
        
        UIView.animateWithDuration(0.25, animations: {
            self.transform = CGAffineTransformMakeTranslation(0, -480)
            self.bgView.backgroundColor = UIColor(white: 0, alpha: GLOBAL_SHADOW_ALPHA)
        }) { (_) in
            self.textView.delegate = self
        }
    }
    
    /**
     隐藏评论视图
     */
    func dismiss() -> Void {
        
        textView.resignFirstResponder()
        
        UIView.animateWithDuration(0.25, animations: {
            self.transform = CGAffineTransformIdentity
            self.bgView.backgroundColor = UIColor(white: 0, alpha: 0)
        }) { (_) in
            self.bgView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
    
    func textViewDidChange(textView: UITextView) {
        if textView.text.characters.count >= 3 {
            sendButton.enabled = true
            sendButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        } else {
            sendButton.enabled = false
            sendButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        }
    }
    


}
