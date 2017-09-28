//
//  noLoginHeaderView.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import IBAnimatable

class NoLoginHeaderView: UIView {

    /// 更多登录方式按钮点击
    @IBOutlet weak var moreLoginButton: AnimatableButton!
    
    @IBOutlet weak var bgImageView: UIImageView!

    @IBOutlet weak var Headerimage: UIImageView!
    
    /// 收藏按钮
    @IBOutlet weak var favoriteButton: UIButton!
    /// 收藏按钮
    @IBOutlet weak var historyButton: UIButton!
    /// 日间/夜间按钮
    @IBOutlet weak var dayOrNightButton: VerticalButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.height = screenHeight * 0.4
        /// 设置主题
        moreLoginButton.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        moreLoginButton.theme_setTitleColor("colors.moreLoginColor", forState: .normal)
        favoriteButton.theme_setImage("images.collectionButton", forState: .normal)
        favoriteButton.theme_setTitleColor("colors.black", forState: .normal)
        favoriteButton.theme_backgroundColor = "colors.cellBackgroundColor"
        historyButton.theme_setImage("images.historyButton", forState: .normal)
        historyButton.theme_setTitleColor("colors.black", forState: .normal)
        historyButton.theme_backgroundColor = "colors.cellBackgroundColor"
        dayOrNightButton.theme_setImage("images.dayOrNightButton", forState: .normal)
        dayOrNightButton.theme_setTitleColor("colors.black", forState: .normal)
        dayOrNightButton.theme_backgroundColor = "colors.cellBackgroundColor"
        dayOrNightButton.setTitle("夜间", for: .normal)
        dayOrNightButton.setTitle("日间", for: .selected)
        dayOrNightButton.isSelected = UserDefaults.standard.bool(forKey: isNight)
        
        let imagerLayer: CALayer = Headerimage.layer
        imagerLayer.masksToBounds = true
        imagerLayer.cornerRadius = Headerimage.frame.size.height/2
    }
    
    class func headerView() -> NoLoginHeaderView {
        let headerView = Bundle.main.loadNibNamed(String(describing: self), owner: nil
            , options: nil)?.last as! NoLoginHeaderView
        return headerView
    }
    
    
    @IBAction func dayOrNightButtonClciked(_ sender: VerticalButton) {
        sender.isSelected = !sender.isSelected
        UserDefaults.standard.set(sender.isSelected, forKey: isNight)
        /// 选中为夜间，默认为日间
        MyTheme.switchNight(sender.isSelected)
    }
    

}
