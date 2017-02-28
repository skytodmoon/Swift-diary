//
//  ViewController.swift
//  Shopping
//
//  Created by 金亮齐 on 2017/2/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,NewItemViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var toBuyItems = [ Item(itemName:"牛奶",brandName: "三元"),Item(itemName:"牛奶",brandName:"三元"),Item(itemName:"方便面",brandName:"康师傅"),Item(itemName:"果粒橙",brandName:"汇源"),Item(itemName:"巧克力",brandName:"德芙"),Item(itemName:"地板净",brandName:"滴露"),Item(itemName: "洗发水",brandName: "飘柔")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
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
            let destination: ItemViewController = segue.destinationViewController as! ItemViewController
            if sender is Int {
                let item = toBuyItems[sender as! Int]
                destination.item = item
            }else if segue.identifier == "newItemSegue"{
                let destination: NewItemViewController = segue.destinationViewController as! NewItemViewController
                destination.delegate = self
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1,reuseIdentifier: "Cell")
        let item = toBuyItems[indexPath.row]
        cell.textLabel?.text = item.itemName
        if item.isBuy {
            cell.textLabel?.textColor = UIColor.greenColor()
        }else{
            cell.textLabel?.textColor = UIColor.redColor()
        }
        cell.detailTextLabel?.text = item.brandName
        return cell
    }
    func addNewItem(controller: NewItemViewController, item: Item) {
        toBuyItems.append(item)
        tableView.reloadData()
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

