//
//  OfflineDownloadCell.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class OfflineDownloadCell: UITableViewCell {

    var topTitle: TopicTitle? {
        didSet {
            nameLabel.text = topTitle?.name
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedImageView.image = UIImage(named: (selected ? "air_download_option_press_20x20_" : "air_download_option_20x20_"))
    }

}
