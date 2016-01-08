//
//  GuanyinResultView.swift
//  fate
//
//  Created by xieyang on 15/12/21.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit


class GuanyinResultView: UIViewController {
    
    
    var base: bassClass = bassClass()
    let text = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
 
        
        let width = self.view.frame.width
//        let height = self.view.frame.height
        let num = self.base.cacheGetString("num")
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.title = StringUtils().numToString(num)
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        //        self.navigationItem.leftBarButtonItems?.append(backItem)
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(navigationBar)

        
        text.frame = CGRectMake(10, 100, width-20, 400)
        text.textColor = UIColor.whiteColor()
//        text.font = UIFont.boldSystemFontOfSize(30)
        text.font = UIFont.systemFontOfSize(20)
        text.editable = false
        text.backgroundColor = UIColor.grayColor()
//        text.layer.borderWidth = 1
//        text.layer.cornerRadius = 8.0
        self.view.addSubview(text)
        
        
       
        showMessage(Int(num)!)

        
        let btnQian = UIButton(type: .System)
        btnQian.setTitle("再 摇 一 签", forState: UIControlState.Normal)
        btnQian.frame = CGRectMake(10, 530, width-20, 50)
        btnQian.addTarget(self, action: "oneMore", forControlEvents: UIControlEvents.TouchUpInside)
        //        btnQian.layer.borderWidth = 1
        btnQian.backgroundColor = UIColor.grayColor()
        btnQian.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        //        btnQian.layer.cornerRadius = 4.0
        self.view.addSubview(btnQian)
        
        
    }
    
    
    func showMessage(num:Int) {
        
        let path = NSBundle.mainBundle().pathForResource("Linqian.plist", ofType: nil)
                let myDict = NSDictionary(contentsOfFile: path!)
        
                print("\n---------------------------\n", terminator: "")
                let showMsg = myDict?.objectForKey("\(num)") as! String
        
        
                text.text = showMsg

        
    }
    
    
    func back(){
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func oneMore() {
        self.presentViewController(GuanyinViewController(), animated: false, completion: nil)
    }
    
   
}
