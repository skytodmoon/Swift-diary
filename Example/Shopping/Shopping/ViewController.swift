//
//  ViewController.swift
//  Shopping
//
//  Created by 金亮齐 on 2017/2/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let toBuyItems = [("牛奶","三元"),("牛奶","三元"),("方便面","康师傅"),("果粒橙","汇源"),("巧克力","德芙"),("地板净","滴露"),("洗发水","飘柔")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toBuyItems.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("itemSegue", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "itemSegue" {
            var destination: ItemViewController = segue.destinationViewController as! ItemViewController
            if sender is Int {
                var (itemName, brandName) = toBuyItems[sender as! Int]
                
                destination.itemName = itemName
                destination.brandName = brandName
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1,reuseIdentifier: "Cell")
        let (item,brand) = toBuyItems[indexPath.row]
        cell.textLabel?.text = item
        cell.detailTextLabel?.text = brand
        return cell
    }

}

