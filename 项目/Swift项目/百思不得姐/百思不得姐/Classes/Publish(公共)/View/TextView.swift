//
//  TextView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class TextView: UITextView {

    var placeholder: String = ""
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        let name = NSNotification.Name.UITextViewTextDidChange
        NotificationCenter.default.addObserver(self, selector: #selector(textViewChange), name: name, object: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        if !self.text.isEmpty {
            return
        }
        let x: CGFloat = 3.0
        let y: CGFloat = 7.0
        let textRect = CGRect(x: x, y: y, width: screenWidth - 2 * x, height: frame.height)
        let text = placeholder as NSString
        text.draw(in: textRect, withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor : UIColor.lightGray])
    }
    
    @objc private func textViewChange() {
        setNeedsDisplay()
    }

}
