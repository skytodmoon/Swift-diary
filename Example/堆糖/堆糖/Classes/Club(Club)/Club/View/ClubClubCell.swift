//
//  ClubClubCell.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ClubClubCell: UITableViewCell {
    
    var clubClubModel: ClubClubModel?{
        didSet{
            
            photoImageView?.yy_imageURL = NSURL(string: clubClubModel!.path!)
            
            nameLabel?.text = clubClubModel!.name
            
            unreadLabel?.text = "\(clubClubModel!.topic_unread)"
        }
    }
    
    @IBOutlet weak  var photoImageView: UIImageView!
    @IBOutlet weak  var nameLabel: UILabel!
    @IBOutlet weak  var unreadLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
