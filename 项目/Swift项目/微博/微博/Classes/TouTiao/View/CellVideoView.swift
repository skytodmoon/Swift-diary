//
//  CellVideoView.swift
//  微博
//
//  Created by 金亮齐 on 2017/9/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


import UIKit

class CellVideoView: UIView {

    @IBOutlet weak var imageButton: UIButton!
    
    class func cellVideoView() -> CellVideoView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! CellVideoView
    }

}
