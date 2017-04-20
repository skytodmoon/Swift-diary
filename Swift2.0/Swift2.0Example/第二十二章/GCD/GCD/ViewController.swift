//
//  ViewController.swift
//  GCD
//
//  Created by 金亮齐 on 2017/4/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let STR_URL = "http://www.51work6.com/book/test2.jpg"
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let screen = UIScreen.mainScreen().bounds
        
        let button = UIButton(type: UIButtonType.System)
        button.setTitle("Load Image", forState: UIControlState.Normal)
        
        let buttonWidth:CGFloat = 200
        let buttonHeight:CGFloat = 20
        let buttonTopView:CGFloat = 80
        
        button.frame = CGRectMake((screen.size.width - buttonWidth)/2 , buttonTopView, buttonWidth, buttonHeight)
        
        button.addTarget(self, action: #selector(ViewController.onClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        let imageViewWidth:CGFloat = 300
        let imageViewHeight:CGFloat = 260
        let imageViewTopView:CGFloat = 120
        
        imageView = UIImageView(frame: CGRectMake((screen.size.width - imageViewWidth)/2 , imageViewTopView, imageViewWidth, imageViewHeight))
        
        self.view.addSubview(imageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onClick(sender: AnyObject) {
        
        self.imageView.image = nil
        
        let imgkURL = NSURL(string: STR_URL)
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0), {
            
            let imgData = NSData(contentsOfURL: imgkURL!)
            let img = UIImage(data: imgData!)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView.image = img
            })
        })
    }

}

