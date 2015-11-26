//
//  ssViewController.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import UIKit

class ssViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let laber = UILabel() as UILabel
        laber.frame = CGRectMake(self.view.frame.width/2-200, 50, 200, 30)
        laber.text = "woqu"
        laber.textColor = UIColor.redColor()
        self.view.addSubview(laber)
        
        
        let txt = UITextField()
        txt.frame = CGRectMake(self.view.frame.width/2-200, 100, 200, 30)
        txt.placeholder = "请输入用户名"
        self.view.addSubview(txt)
        
        
        let phone = UITextField()
        phone.frame = CGRectMake(self.view.frame.width/2-200, 150, 200, 30)
        phone.placeholder = "请输入手机号码"
        self.view.addSubview(phone)
        
        let birth = UIPickerView()
        birth.frame = CGRectMake(self.view.frame.width/2-200, 200, 200, 30)
         self.view.addSubview(birth)
        
        let btn = UIButton()
        btn.frame = CGRectMake(self.view.frame.width/2-200, 250, 200, 30)
        btn.setTitle("算命", forState: UIControlState.Normal)
        self.view.addSubview(btn)
        
       
        
        
       
        
        
        
        let backBtn = UIButton.buttonWithType(.System) as! UIButton
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.frame = CGRectMake(self.view.frame.width/2-200, 25, 200, 30)
        backBtn.addTarget(self,action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backBtn)
        
        
        self.view.backgroundColor = UIColor.whiteColor();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
