//
//  FriednRequestCell.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class FriednRequestCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Name"
        label.font = UIFont.systemFontOfSize(12)
        return label
    }()
    
    let requestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.backgroundColor = UIColor.blueColor()
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confime", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor.rgb(87, green: 143, blue: 255)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(10)
        button.layer.cornerRadius = 2
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", forState: .Normal)
        button.setTitleColor(UIColor(white: 0.3,alpha: 1), forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(10)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7,alpha: 1).CGColor
        return button
    }()
    
    
    private func setupViews() {
        addSubview(requestImageView)
        addSubview(nameLabel)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        
        addConstraintsWithFormat("H:|-16-[v0(52)]-8-[v1]|", views: requestImageView,nameLabel)
        addConstraintsWithFormat("V:|-4-[v0]-4-|", views: requestImageView)
        addConstraintsWithFormat("V:|-8-[v0]-8-[v1(24)]-8-|", views: nameLabel,confirmButton)

        addConstraintsWithFormat("H:|-76-[v0(80)]-8-[v1(80)]", views: confirmButton,deleteButton)
        addConstraintsWithFormat("V:[v0(24)]-8-|", views: deleteButton)
}
    

}
