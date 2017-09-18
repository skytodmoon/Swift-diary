//
//  ShareView.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ShareView: UIView,NibLoadable {
    
    // 定义一个 bun 数组
    @IBOutlet  var shareBtns: [CustomBtn]!
    
    
    @IBAction func didClickCopyBtn(_ sender: CustomBtn) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = "www.baidu.com"
    }
    
    
}

extension ShareView {
    func showShareView() {
        
        // 1.改变 btn 的位置
        for btn in shareBtns {
            btn.transform = CGAffineTransform(translationX: 0, y: 200)
        }
        
        // 2. 恢复 btn 的位置
        for (index,btn) in shareBtns.enumerated() {
            UIView.animate(withDuration: 0.5, delay: 0.25 + Double(index) * 0.02, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
                btn.transform = CGAffineTransform.identity
            }, completion: nil)
            
        }
        
    }
}

