//
//  ViewController.swift
//  计算器
//
//  Created by 金亮齐 on 2017/2/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    /*** 第一操作数 */
    var firstOperand:Double = 0.0
    /*** 第二操作数 */
    var secondOperand:Double = 0.0
    /*** 标记是否输入小数点 */
    var decimalPointFlag:Bool = false
    /*** 是否输入第二操作数 */
    var isSecond:Bool = false
    /*** 操作符 */
    var operandFlag:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTap(sender: UIButton) {
        /*** labelResult中默认是0，如果开始输入数字,则先清除0*/
        
        
    }
    
    @IBAction func decimalPointTap() {
        
        if isSecond {
            secondOperand = (labelResult.text! as NSString).doubleValue
        }else{
            firstOperand = (labelResult.text! as NSString).doubleValue
        }
        decimalPointFlag = !decimalPointFlag
    }
    

}

