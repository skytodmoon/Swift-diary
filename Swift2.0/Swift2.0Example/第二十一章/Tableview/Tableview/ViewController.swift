//
//  ViewController.swift
//  Tableview
//
//  Created by 金亮齐 on 2017/4/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    
    var listTeams: [[String: String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!) as? [[String: String]]
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let screen = UIScreen.mainScreen().bounds
        
        let labelWidth:CGFloat = 90
        let labelHeight:CGFloat = 20
        let labelTopView:CGFloat = 150
        label = UILabel(frame: CGRectMake((screen.size.width - labelWidth)/2 , labelTopView, labelWidth, labelHeight))
        
        label.textAlignment = NSTextAlignment.Center
        label.text = "Label"
        self.view.addSubview(label)
        
        let navigationBarHeight:CGFloat = 44
        let statusBarHeight:CGFloat = 20
        let navigationBar = UINavigationBar(frame: CGRectMake(0 , statusBarHeight, screen.size.width, navigationBarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "save:")
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add:")
        
        let titleItem = UINavigationItem(title: "Home")
        titleItem.leftBarButtonItem = saveButtonItem
        titleItem.rightBarButtonItem = addButtonItem
        
        navigationBar.items = [titleItem]
        
        self.view.addSubview(navigationBar)

        
    }
    
    func save(sender: AnyObject) {
        label.text = "点击Save"
    }
    
    func add(sender: AnyObject) {
        self.label.text = "单击Add"
    }

}


extension ViewController : UITableViewDataSource {
    
    //UITableViewDataSource 协议方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellIdentifier"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        let rowDict = self.listTeams[row] as [String: String]
        
        cell.textLabel?.text = rowDict["name"] as String?
        
        let imagePath = String(format: "%@.png", rowDict["image"]! as String)
        
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        let rowDict = self.listTeams[row] as [String: String]
        let name = rowDict["name"] as String?
        
        print("选择球队: \(name!)")
    }
}

