//
//  StatusPictureView.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class StatusPictureView: UICollectionView {
    var status: Status?
    {
        didSet{
            reloadData()
        }
    }
    
    private var pictureLayout: UICollectionViewFlowLayout =  UICollectionViewFlowLayout()
    init()
    {
        super.init(frame: CGRect.zero, collectionViewLayout: pictureLayout)
        
        register(PictureViewCell.self, forCellWithReuseIdentifier: PictureViewCellReuseIdentifier)
        dataSource = self
        delegate = self
        pictureLayout.minimumInteritemSpacing = 5
        pictureLayout.minimumLineSpacing = 5
        backgroundColor = UIColor.clear
    }
    
    
    func calculateImageSize() -> CGSize
    {
        let count = status?.storedPicURLS?.count
        if count == 0 || count == nil
        {
            return CGSize.zero
        }
        if count == 1
        {
            let key = status?.storedPicURLS!.first?.absoluteString
            let image = KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: key!)
            pictureLayout.itemSize = image!.size
            return image!.size
        }
        let margin:CGFloat = 5.0
        if count == 4 || count == 2
        {
            let cellWidth: CGFloat = 90.0
            pictureLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            let viewWidth = cellWidth * 2 + margin
            return CGSize(width: viewWidth, height: viewWidth * CGFloat(count! / 4))
        }
        let rowNumber = (count! - 1) / 3 + 1
        let viewWidth = UIScreen.main.bounds.size.width - 2 * margin
        let viewHeight = viewWidth / 3 * CGFloat(rowNumber)
        let cellWidth = viewWidth/3 -  margin
        pictureLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        return CGSize(width: viewWidth, height: viewHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    class PictureViewCell: UICollectionViewCell {
        
        var imageURL: URL?
        {
            didSet{
                iconImageView.kf.setImage(with: imageURL)
                if (imageURL!.absoluteString as NSString).pathExtension.lowercased() == "gif"
                {
                    gifView.isHidden = false
                }
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        private func setupUI()
        {
            contentView.clipsToBounds = true
            contentView.addSubview(iconImageView)
            contentView.addSubview(gifView)
            iconImageView.snp.makeConstraints { (make) -> Void in
                make.top.bottom.equalTo(contentView)
                make.right.left.equalTo(contentView)
            }
            
            gifView.snp.makeConstraints { (make) -> Void in
                make.right.equalTo(iconImageView.snp.right)
                make.bottom.equalTo(iconImageView.snp.bottom)
                make.height.equalTo(10)
                make.width.equalTo(20)
            }
        }
        
        private lazy var iconImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        private lazy var gifView: UILabel = {
            let gifView = UILabel()
            gifView.backgroundColor = UIColor ( red: 0.3406, green: 0.7527, blue: 0.9988, alpha: 0.729544974662162 )
            gifView.textColor = UIColor.white
            gifView.text = "GIF"
            gifView.textAlignment = .center
            gifView.font = UIFont.systemFont(ofSize: 8)
            gifView.isHidden = true
            return gifView
        }()
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}

let StatusPictureViewSelected = "StatusPictureViewSelected"
//MARK: - 当前选中图片的索引
let StatusPictureViewIndexKey = "StatusPictureViewIndexKey"
//MARK: - 本条所有大图的数组
let StatusPictureViewURLsKey = "StatusPictureViewURLsKey"

//MARK: - UICollectionViewDataSource,UICollectionViewDelegate
extension StatusPictureView: UICollectionViewDataSource ,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status?.storedPicURLS?.count ?? 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureViewCellReuseIdentifier, for: indexPath) as? PictureViewCell
        cell?.imageURL = status?.storedPicURLS![indexPath.item] as URL?
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = [StatusPictureViewIndexKey : indexPath, StatusPictureViewURLsKey : status!.storedLargePicURLS!] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: StatusPictureViewSelected), object: self)
    }
}
