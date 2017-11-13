//
//  PublishTextViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import SnapKit

class PublishTextViewController: UIViewController {

    var rightButton: UIButton!
    let textView = TextView(frame: UIScreen.main.bounds)
    let tagView = PublishTagView.publishTagView()
    
    var tagButtons: [PublishTagButton] = [PublishTagButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupNav()
        setupView()
        setupTagView()
    }
    
    private func setupNav() {
        
        navigationItem.titleView = PublishNavigationController.titleView(titile: "发表文字", font: UIFont.systemFont(ofSize: 17), color: UIColor.black)
        navigationItem.leftBarButtonItem = PublishNavigationController.itemButton(title: "取消", self, #selector(cancel)).0
        let rightBarButtonWithButton = PublishNavigationController.itemButton(title: "发表", self, #selector(post))
        navigationItem.rightBarButtonItem = rightBarButtonWithButton.0
        
        rightButton = rightBarButtonWithButton.1
        rightButton.isEnabled = false;
        
        navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func setupView() {
        textView.placeholder = "把好玩的图片，好笑的段子或糗事发到这里，接受千万网友膜拜吧！发布违反国家法律内容的，我们将依法提交给有关部门处理。"
        view.addSubview(textView)
        
        let name = NSNotification.Name.UITextViewTextDidChange
        NotificationCenter.default.addObserver(self, selector: #selector(textViewChange(_:)), name: name, object: nil)
        
    }
    
    private func setupTagView() {
        
        // 1.tagview
        view.addSubview(tagView)
        // 2.创建标签button
        let btn1 = PublishTagButton.init(false)
        btn1.setTitle("搞笑", for: .normal)
        let btn2 = PublishTagButton.init(false)
        btn2.setTitle("糗事", for: .normal)
        
        // 3.计算button的位置
        tagButtons.append(btn1)
        tagButtons.append(btn2)
        
        let viewHeight = setTagButtonsFrame(tagButtons)
        
        let bottom: CGFloat = (screenHeight == iPhoneXHeight) ? 34 : 0
        
        tagView.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self.view).offset(0)
            maker.left.bottom.equalTo(self.view).offset(0)
            maker.height.equalTo(viewHeight + bottom)
        }
        
    }
    
    @objc private func textViewChange(_ notifation: Notification) {
        
        let object = notifation.object
        guard let tv = object as? TextView else {
            return
        }
        guard !(tv.text.isEmpty) else {
            rightButton.isEnabled = false
            return
        }
        rightButton.isEnabled = true
    }
    
    @objc private func cancel() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func post() {
        
        print("post")
        
    }
    
    
    // MARK: - 设置button的位置
    
    private func setTagButtonsFrame(_ buttons: [PublishTagButton]) -> CGFloat {
        
        let maxWidth = (screenWidth - cellTextMargin * 2)
        
        var maxHeight: CGFloat = 40.0
        
        let buttonHeight: CGFloat = 40.0
        
        let y: CGFloat = 5
        for i in 0..<buttons.count  {
            
            let button = buttons[i]
            var width = button.titleLabel!.text!.width(CGSize.init(width: 1000.0, height: 40.0), [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): button.titleLabel?.font ?? UIFont.systemFont(ofSize: 15.0)])
            
            width += cellTextMargin
            
            if width > maxWidth {
                width = maxWidth
            }
            
            if i == 0 {
                button.frame = CGRect(x: cellTextMargin, y: y, width: width, height: buttonHeight - cellTextMargin)
            } else {
                let previousButton = buttons[i - 1]
                let previousButtonMaxX = previousButton.frame.maxX
                if  previousButtonMaxX + width > maxWidth{
                    button.frame = CGRect(x: cellTextMargin, y: maxHeight + y, width: width, height: buttonHeight - cellTextMargin)
                    maxHeight += buttonHeight
                } else {
                    button.frame = CGRect(x: previousButtonMaxX + 10, y: maxHeight - buttonHeight + y, width: width, height: buttonHeight - cellTextMargin)
                }
            }
            
            if i == buttons.count - 1 {
                let previousButton = buttons[i]
                let previousButtonMaxX = previousButton.frame.maxX
                if  previousButtonMaxX + addButton.frame.width > maxWidth{
                    addButton.frame = CGRect(x: cellTextMargin, y: maxHeight + y, width: 30, height: 30)
                    maxHeight += buttonHeight
                } else {
                    addButton.frame = CGRect(x: previousButtonMaxX + 10, y: maxHeight - buttonHeight + y, width: 30, height: 30)
                }
                tagView.addSubview(addButton)
            }
            tagView.addSubview(button)
        }
        return maxHeight + buttonHeight
    }
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: UIButtonType.contactAdd)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(addtag), for: .touchUpInside)
        return button
    }()
    
    @objc private func addtag() {
        
        let tagVC = AddTagViewController()
        
        navigationController?.pushViewController(tagVC, animated: true)
        
    }
}
