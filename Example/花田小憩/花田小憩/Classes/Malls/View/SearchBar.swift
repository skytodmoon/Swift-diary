//
//  SearchBar.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class SearchBar: UIView,UITextFieldDelegate{
    
    weak var delegate : SearchBarDelegate?
    
    // 清理搜索框
    func clearText() {
        filed.text = ""
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = UIColor.init(gray: 247)
        
        addSubview(filed)
        addSubview(cancelBtn)
        
        cancelBtn.snp_makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.height.equalTo(self)
            make.width.equalTo(40)
        }
        
        filed.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(cancelBtn.snp_left).offset(-5)
            make.height.equalTo(27)
            make.centerY.equalTo(cancelBtn)
        }
        
    }
    
    // MARK: - 懒加载
    // 输入框
    private lazy var filed : UITextField = {
        let filed = UITextField()
        filed.background = UIImage(named: "hp_search_bg_259x27_")
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        view.backgroundColor = UIColor.whiteColor()
        filed.leftView = view
        filed.leftViewMode = .Always
        filed.font = defaultFont14
        // 设置placeholder和字体大小
        filed.placeholder = "请输入搜索关键字"
        filed.setValue(UIFont.systemFontOfSize(13), forKeyPath: "_placeholderLabel.font")
        // 设置return按钮的文字是搜索
        filed.returnKeyType = .Search
        filed.delegate = self
        // 没有东西的时候不可点击
        filed.enablesReturnKeyAutomatically = true
        return filed
    }()
    
    // 取消按钮
    private lazy var cancelBtn : UIButton = {
        let btn = UIButton(title: "取消", imageName: nil, target: nil, selector: nil, font: UIFont.systemFontOfSize(14), titleColor: UIColor.blackColor())
        btn.addTarget(self, action: #selector(SearchBar.cancel), forControlEvents: .TouchUpInside)
        return btn
    }()
    
    // MARK: - 内部控制方法
    // 点击了取消
    @objc private func cancel() {
        delegate?.searchBarDidCancel!(self)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 如果不是第一响应者, 就设置为第一响应者
        if !filed.isFirstResponder() {
            filed.becomeFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.searchBar!(self, search: textField.text!)
        return true
    }
}

@objc
protocol  SearchBarDelegate : NSObjectProtocol{
    // 点击了取消按钮
    optional func searchBarDidCancel(searchBar: SearchBar)
    // 进行搜索
    optional func searchBar(searchBar: SearchBar, search: String)

}
