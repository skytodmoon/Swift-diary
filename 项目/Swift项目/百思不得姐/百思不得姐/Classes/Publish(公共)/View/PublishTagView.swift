//
//  PublishTagView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class PublishTagView: UIView {

    @IBOutlet weak var tagVeiw: UIView!
    
    class func publishTagView() -> PublishTagView {
        let view = Bundle.main.loadNibNamed("PublishTagView", owner: nil, options: nil)?.first as! PublishTagView
        return view
    }

}
