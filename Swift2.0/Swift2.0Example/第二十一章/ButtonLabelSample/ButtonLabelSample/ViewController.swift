//
//  ViewController.swift
//  ButtonLabelSample
//
//  Created by 金亮齐 on 2017/4/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let screen = UIScreen.mainScreen().bounds
        let labelWidth:CGFloat = 90
        let labelHeight:CGFloat = 20
        let labelTopView:CGFloat = 150
        let label = UILabel(frame: CGRectMake((screen.size.width - labelWidth)/2 , labelTopView, labelWidth, labelHeight))
        
        label.text = "Lable"
        label.textAlignment = .Center
        self.view .addSubview(label)
        
        let button = UIButton(type: UIButtonType.Custom)
        button.setTitle("OK", forState: UIControlState.Normal)
        
        let buttonWidth:CGFloat = 60
        let buttonHeight:CGFloat = 20
        let buttonTopView:CGFloat = 240
        
        button.frame = CGRectMake((screen.size.width - buttonWidth)/2 , buttonTopView, buttonWidth, buttonHeight)
        button.addTarget(self, action: #selector(ViewController.onClick(external:forEvent:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        let userInfo = [ "String" : "Hello", "Result" : 10 ]
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                       target: self,
                                                       selector: #selector(ViewController.timerFireMethod(_:)),
                                                       userInfo: userInfo,
                                                       repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        timer?.invalidate()
        timer = nil
        
    }
    
    func timerFireMethod(timer: NSTimer) {
        if let userInfo : AnyObject = timer.userInfo {
            let value = userInfo["String"]
            let result = userInfo["Result"]
            print("\(value)")
            print("\(result)")
        }
        
        let redValue: CGFloat = CGFloat(arc4random() % 255) / 255.0
        let greenValue: CGFloat = CGFloat(arc4random() % 255) / 255.0
        let blueValue: CGFloat = CGFloat(arc4random() % 255) / 255.0
        
        self.view.backgroundColor = UIColor(red: redValue,
                                            green: greenValue,
                                            blue: blueValue,
                                            alpha: 1.0)
    }
    
    func onClick(sender: AnyObject) {
        NSLog("OK Button onClick1.")
    }
    
    func onClick(external sender: AnyObject, forEvent event: UIEvent) {
        NSLog("OK Button onClick2.")
    }

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesBegan - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesMoved - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesEnded - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch)
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        NSLog("touchesCancelled - touch count = %i", touches!.count)
        for touch in touches! {
            self.logTouchInfo(touch)
        }
    }
    
    func logTouchInfo(touch : UITouch) {
        
        let locInSelf = touch.locationInView(self.view)
        let locInWin = touch.locationInView(nil)
        
        NSLog("    touch.locationInView = {%.2f, %.2f}", locInSelf.x.native, locInSelf.y.native)
        NSLog("    touch.locationInWin = {%.2f, %.2f}", locInWin.x.native, locInWin.y.native)
        NSLog("    touch.phase = %i", touch.phase.rawValue) //UITouchPhase
        NSLog("    touch.tapCount = %d", touch.tapCount)
        
    }

}

