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
    
    let text = UITextView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg = self.base.cacheGetString("msg")

        
        let laber = UILabel() as UILabel
        laber.frame = CGRectMake(200, 200, 200, 200)
        laber.text = msg
        laber.textColor = UIColor.redColor()
     //   self.view.addSubview(laber)
        
        
        let backBtn = UIButton.buttonWithType(.System) as! UIButton
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.frame = CGRectMake(self.view.frame.width/2-200, 50, 100, 30)
        backBtn.addTarget(self,action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        backBtn.layer.borderWidth = 1
        backBtn.layer.cornerRadius = 4.0
        self.view.addSubview(backBtn)
        
    
        let btnQian = UIButton.buttonWithType(.System) as! UIButton
        btnQian.setTitle("求签", forState: UIControlState.Normal)
        btnQian.frame = CGRectMake(self.view.frame.width/2-50, 50, 100, 30)
        btnQian.addTarget(self, action: "showMsg", forControlEvents: UIControlEvents.TouchUpInside)
        btnQian.layer.borderWidth = 1
        btnQian.layer.cornerRadius = 4.0
        self.view.addSubview(btnQian)
        
        
       // lable.frame = CGRectMake(self.view.frame.width/2-50, 150, 200, 30)
        // self.view.addSubview(lable)
        
        text.frame = CGRectMake(self.view.frame.width/2-200, 150, self.view.frame.width-20, 400)
//        CGRectMake(<#x: CGFloat#>, <#y: CGFloat#>, width: CGFloat, <#height: CGFloat#>)
        text.textColor = UIColor.redColor()
        text.font = UIFont.boldSystemFontOfSize(30)
        text.editable = false
        text.layer.borderWidth = 1
//        [[UIColor colorWithRed:230.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]CGColor]
//        text.layer.borderColor =
        text.layer.cornerRadius = 8.0
        self.view.addSubview(text)
        

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
        
        let path = NSBundle.mainBundle().pathForResource("Linqian.plist", ofType: nil)
        // print(path)
        var myDict = NSDictionary(contentsOfFile: path!)

        print(myDict)
       
        print("\n---------------------------\n")
        let showMsg = myDict?.objectForKey("\(num)") as! String
        print(showMsg)
        
        lable.text = showMsg
        
        text.text = showMsg
        
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
