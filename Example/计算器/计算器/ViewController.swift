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
        if labelResult.text == "0" || (isSecond && secondOperand == 0.0){
            labelResult.text = ""
        }
        /** 将用户录入的数添加到lableResult中 **/
        labelResult.text = labelResult.text! + sender.titleLabel!.text!
        if isSecond {
            secondOperand = NSString(string:labelResult.text!).doubleValue
            }else{
            /**将lableResult中的字符串转化为双精度数 **/
                firstOperand = NSString(string:labelResult.text!).doubleValue
        }
        
    }
    
    @IBAction func decimalPointTap() {
        /***  如果没有输入小数点则执行下面的的操作 */
        if !decimalPointFlag {
            labelResult.text = labelResult.text! + "."
            if isSecond{
                secondOperand = NSString(string:labelResult.text!).doubleValue
        }else{
                firstOperand = NSString(string:labelResult.text!).doubleValue
        }
        decimalPointFlag = !decimalPointFlag
        }
    }
    
    @IBAction func opeartopTap(sender: UIButton) {
        if firstOperand != 0{
            isSecond = true
            decimalPointFlag = false
            
            switch sender.titleLabel!.text! {
            case "+":
                operandFlag = "+"
            case "-":
                operandFlag = "-"
            case "x":
                operandFlag = "x"
            case "/":
                operandFlag = "/"
            default:
                operandFlag = ""
            }
        }
    }
    
    @IBAction func resultTap() {
        /***  确保第二操数有值 */
        if isSecond {
            //除数不能为0
            if operandFlag == "/" && secondOperand == 0{
                print("Error:除数不能为0")
                return
            }
            var result: Double = 0.0
            switch operandFlag {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "*":
                result = firstOperand * secondOperand
            case "/":
                result = firstOperand / secondOperand
            default:
                result = 0.0
            }
            
            labelResult.text = result.description
            
            print("第一操作数: \(firstOperand)")
            print("第二操作数: \(secondOperand)")
            print("操作符: \(operandFlag)")
            print("结果: \(result)")
        }
    }
    
    
    @IBAction func clear() {
        labelResult.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        decimalPointFlag = false
        isSecond = false
        operandFlag = ""
    }
}
