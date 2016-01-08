//
//  GuanyinViewController.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import UIKit

class ShakeResult: UIViewController {
    
    var base: bassClass = bassClass()
    
    let text = UILabel()
    
    var num:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        num = rand(101, min: 1)
        
        
        let width = self.view.frame.width
//        let height = self.view.frame.height
        
        self.navigationItem.title = "观音灵签"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        //        self.navigationItem.leftBarButtonItems?.append(backItem)
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.redColor()
        self.view.addSubview(navigationBar)
        
        
        let btnQian = UIButton(type: .System)
        btnQian.setTitle("解签", forState: UIControlState.Normal)
        btnQian.frame = CGRectMake(10, 530, width-20, 50)
        btnQian.addTarget(self, action: "showMsg", forControlEvents: UIControlEvents.TouchUpInside)
//        btnQian.layer.borderWidth = 1
        btnQian.backgroundColor = UIColor.grayColor()
        btnQian.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        btnQian.layer.cornerRadius = 4.0
        self.view.addSubview(btnQian)
 
        
        text.frame = CGRectMake(10, 100, width-20, 400)
        text.textColor = UIColor.whiteColor()
        text.backgroundColor = UIColor.grayColor()
        text.font = UIFont.boldSystemFontOfSize(30)
        text.textAlignment = NSTextAlignment.Center
        text.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        text.t
        
//        text.layer.borderWidth = 1
        //        [[UIColor colorWithRed:230.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]CGColor]
//        text.layer.cornerRadius = 8.0
        text.text = StringUtils().numToString("\(num)")
        self.view.addSubview(text)
        
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        UIApplication.sharedApplication().applicationSupportsShakeToEdit = true
        self.becomeFirstResponder()
        
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
    
    func showMsg() {
        self.base.cacheSetString("num", value: "\(num)")
        self.presentViewController(GuanyinResultView(), animated: false, completion: nil)
    }
    
    
    
    

    
}
