//
//  NewFeatureController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


class NewFeatureController: UIViewController,UIScrollViewDelegate {
    
    var startClosure:(() -> Void)?
    var scrollView: UIScrollView!
    
    var mutableArray: NSMutableArray?
    let x = CGFloat(Float(0))
    let y = CGFloat(Float(0))
    let navH = CGFloat(Float(64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        createInitView()
    }
    func createInitView() {
        
        let arr = ["Guidance_1.png","Guidance_2.png","Guidance_3.png","Guidance_4.png"]
        
        if self.scrollView == nil {
            self.scrollView = UIScrollView.init(frame: CGRect(x: x, y: y, width: ScreenW, height: ScreenH))
            self.scrollView.delegate = self
            self.scrollView.isPagingEnabled = true
            self.scrollView.showsHorizontalScrollIndicator = false
            self.scrollView.showsVerticalScrollIndicator = false
            self.view.addSubview(self.scrollView)
            
            self.scrollView.contentSize = CGSize(width: ScreenW * CGFloat(Float(arr.count)), height: ScreenH)
            
            for i in 0  ..< arr.count  {
                let index = CGFloat(Float(i))
                let imgView = UIImageView.init(frame: CGRect(x: index * ScreenW, y: y, width: ScreenW, height: ScreenH))
                imgView.image = UIImage(named: arr[i])
                self.scrollView.addSubview(imgView)
                
                if i == arr.count - 1 {
                    imgView.isUserInteractionEnabled = true
                    
                    let button = UIButton.init(type: UIButtonType.custom)
                    button.frame = CGRect(x: (ScreenW - 150) / 2, y: ScreenH - 94, width: 150, height: 40)
                    button.setTitle("立即体验", for: UIControlState())
                    button.backgroundColor = UIColor.orange
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                    button.layer.cornerRadius = 5
                    button.layer.masksToBounds = true
                    button.addTarget(self, action: #selector(NewFeatureController.clickButton(_:)), for: UIControlEvents.touchUpInside)
                    imgView.addSubview(button)
                }
            }
        }
        
    }
    
    func clickButton(_ sender: UIButton) {
        
        startClosure!()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


