//
//  InputController.swift
//  ofo(小黄)
//
//  Created by 金亮齐 on 2017/5/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class InputController: UIViewController {
    var isFlashOn = false
    var isVoiceOn = true
    
    @IBAction func flashBtnTap(_ sender: UIButton) {
        isFlashOn = !isFlashOn
        if isFlashOn {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch"), for: .normal)
        }else{
            flashBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch"), for: .normal)
        }
    }
    
    
    @IBAction func voiceBtnTap(_ sender: UIButton) {
        isVoiceOn = !isVoiceOn
        if isVoiceOn {
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
        }else{
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
        }
        
    }
    
    
    @IBOutlet weak var voiceBtn: UIButton!
    @IBOutlet weak var flashBtn: UIButton!
    @IBOutlet weak var inputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "车辆解锁"
        
        inputTextField.layer.borderWidth = 2
        inputTextField.layer.borderColor = UIColor.ofo.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "扫码用车", style: .plain, target:self, action: #selector(backScan))
        // Do any additional setup after loading the view.
    }
    
    func backScan(){
        navigationController?.popViewController(animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
