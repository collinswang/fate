//
//  GuanyinViewController.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import UIKit

class GuanyinViewController: UIViewController {
    
    var base: bassClass = bassClass()
    
    let lable = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg = self.base.cacheGetString("msg")

        
        let laber = UILabel() as UILabel
        laber.frame = CGRectMake(200, 200, 200, 200)
        laber.text = msg
        laber.textColor = UIColor.redColor()
        self.view.addSubview(laber)
        
        
        let backBtn = UIButton.buttonWithType(.System) as! UIButton
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.frame = CGRectMake(self.view.frame.width/2-200, 50, 200, 30)
        backBtn.addTarget(self,action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backBtn)
        
    
        let btnQian = UIButton.buttonWithType(.System) as! UIButton
        btnQian.setTitle("求签", forState: UIControlState.Normal)
        btnQian.frame = CGRectMake(self.view.frame.width/2-200, 100, 200, 30)
        btnQian.addTarget(self, action: "showMsg", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnQian)
        
        
        lable.frame = CGRectMake(self.view.frame.width/2-50, 150, 200, 30)
        self.view.addSubview(lable)
        

        self.view.backgroundColor = UIColor.whiteColor();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(){
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    func rand(max: Int, min: Int) ->Int{
        return Int(arc4random())%(max-min+1)+min
    }
    
    func showMsg() ->String{
        let num = rand(101, min: 1)
        let msg = "随机数时：\(num)"
        lable.text = msg
        return msg
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
