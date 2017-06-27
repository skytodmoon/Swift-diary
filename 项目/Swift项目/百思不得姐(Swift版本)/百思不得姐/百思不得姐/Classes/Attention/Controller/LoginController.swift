//
//  LoginController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class LoginController: UIViewController,UITextFieldDelegate {
    
    let lineWidth:CGFloat = 103
    
    @IBOutlet weak var phoneLabel: QJLTextView!
    @IBOutlet weak var txLogin: UIButton!
    @IBOutlet weak var sinaLogin: UIButton!
    @IBOutlet weak var XXbtn: UIButton!
    @IBOutlet weak var qqLogin: UIButton!
    @IBOutlet weak var letLineWidth: NSLayoutConstraint!
    @IBOutlet weak var rightLineWidth: NSLayoutConstraint!
    @IBOutlet weak var textlabel: UIView!
    
    @IBOutlet weak var registBtn: UIButton!
    @IBOutlet weak var forgetBtn: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var loginLeftConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func switchPage(sender: UIButton) {
        
        sender.selected = !sender.selected
        self.loginLeftConstraint.constant = sender.selected ? -view.frame.width : 0
        UIView.animateWithDuration(0.25) { () -> Void in
            self.view.layoutIfNeeded()
        }
        self.view.endEditing(true)
        
        
    }
    
    @IBAction func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
