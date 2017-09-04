//
//  PhotoBrowserCell.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

protocol PhotoBrowserCellDelegate : NSObjectProtocol{
    func photoBrowserCellDidClose(cell: PhotoBrowserCell)
}


class PhotoBrowserCell: UICollectionViewCell {
    
    weak var photoBrowserCellDelegate : PhotoBrowserCellDelegate?
    
    var imageURL: NSURL?
    {
        didSet{
            reset()
            activity.startAnimating()
            iconView.kf.setImage(with: imageURL as? Resource, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.activity.stopAnimating()
                self.setImageViewPostion()
            }
        }
    }
    
    private func reset() {
        
        scrollview.contentInset = UIEdgeInsets.zero
        scrollview.contentOffset = CGPoint.zero
        scrollview.contentSize = CGSize.zero
        iconView.transform = CGAffineTransform.identity
    }
    
    private func setImageViewPostion(){
        let size = self.displaySize(image: iconView.image!)
        if size.height < UIScreen.main.bounds.height
        {
            iconView.frame = CGRect(origin: CGPoint.zero, size: size)
            let y = (UIScreen.main.bounds.height - size.height) * 0.5
            self.scrollview.contentInset = UIEdgeInsets(top: y, left: 0, bottom: y, right: 0)
        }else{
            iconView.frame = CGRect(origin: CGPoint.zero, size: size)
            scrollview.contentSize = size
        }
    }
    
    private func displaySize(image: UIImage) -> CGSize {
        let scale = image.size.height / image.size.width
        let width = UIScreen.main.bounds.width
        let height =  width * scale
        return CGSize(width: width, height: height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI(){
        
        contentView.addSubview(scrollview)
        scrollview.addSubview(iconView)
        contentView.addSubview(activity)
        scrollview.frame = UIScreen.main.bounds
        activity.center = contentView.center
        scrollview.delegate = self
        scrollview.maximumZoomScale = 2.0
        scrollview.minimumZoomScale = 0.5
        let tap = UITapGestureRecognizer(target: self, action: #selector(PhotoBrowserCell.close))
        iconView.addGestureRecognizer(tap)
        iconView.isUserInteractionEnabled = true
    }
    
    func close()  {
        photoBrowserCellDelegate?.photoBrowserCellDidClose(cell: self)
    }
    
    
    //MARK: - 懒加载UIScrollView
    private lazy var scrollview: UIScrollView = UIScrollView()
    //MARK: - 懒加载UIImageView
    lazy var iconView: UIImageView = UIImageView()
    //MARK: - 懒加载UIActivityIndicatorView
    private lazy var activity: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UIScrollViewDelegate
extension PhotoBrowserCell: UIScrollViewDelegate{
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return iconView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        var offsetX = (UIScreen.main.bounds.width - view!.frame.width) * 0.5
        var offsetY = (UIScreen.main.bounds.height - view!.frame.height) * 0.5
        offsetX = offsetX < 0 ? 0 : offsetX
        offsetY = offsetY < 0 ? 0 : offsetY
        scrollView.contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: offsetY, right: offsetX)
    }
}
