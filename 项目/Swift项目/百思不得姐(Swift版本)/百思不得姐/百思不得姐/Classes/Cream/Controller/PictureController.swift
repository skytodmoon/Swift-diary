//
//  PictureController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class PictureController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    let imageView = UIImageView.init()
    /**  topic  */
    var topic:Topic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(PictureController.backBtn(_:))))
        scrollView.addSubview(imageView)
        
        let pictureW = screenW
        let pictureH = pictureW * (topic?.height)! / (topic?.width)!
        if pictureH > screenH {
            imageView.frame = CGRect(x: 0, y: 0, width: pictureW, height: pictureH)
            scrollView.contentSize = imageView.size
        }else{
            imageView.size = CGSize(width: pictureW, height: pictureH)
            imageView.centerY = screenH * 0.5
        }
        
        
        imageView.kf_setImageWithURL(NSURL.init(string: topic!.large_image)!)
        
    }
    
    // MARK: - event response
    // 返回
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 保存图片到相册
    @IBAction func saveImage() {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image!, self,#selector(PictureController.image(_:didFinishSavingWithError:contextInfo:)), nil);
    }
    
    func image(image: UIImage, didFinishSavingWithError: NSError?, contextInfo: AnyObject) {
        
        if didFinishSavingWithError != nil {
            SVProgressHUD.showErrorWithStatus("保存失败")
        }else {
            SVProgressHUD.showSuccessWithStatus("保存成功")
        }
        
    }


}
