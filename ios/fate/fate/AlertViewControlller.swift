//
//  AlertViewControlller.swift
//  fate
//
//  Created by cullen on 11/28/2015.
//  Copyright © 2015 xieyang. All rights reserved.
//

import UIKit

class AlertViewControlller:  UIViewController  {
    
    var alert1: UIAlertController!
    var alert2: UIAlertController!
    var actionSheet: UIAlertController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let width = self.view.frame.width
        

        self.navigationItem.title = "各种弹窗"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem

        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
        
        // 定义一个按钮，显示最简单的 Alert
        let button1 = UIButton(type: .System)
        button1.frame = CGRectMake(width/2 - 75, 80, 150, 30)
        button1.setTitle("最简单的 Alert", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.layer.cornerRadius = 4.0
        button1.layer.borderWidth = 1

        button1.tag = 1
        
        // 定义一个按钮，显示带文本框的 Alert
        let button2 = UIButton(type: .System)
        button2.frame = CGRectMake(width/2 - 75, 180, 150, 30)
        button2.setTitle("带文本框的 Alert", forState: UIControlState.Normal)
        button2.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.layer.cornerRadius = 4.0
        button2.layer.borderWidth = 1

        button2.tag = 2
        //
        // 定义一个按钮，显示上拉菜单
        let button3 = UIButton(type: .System)
        button3.frame = CGRectMake(width/2 - 75, 280, 150, 30)
        button3.setTitle("上拉菜单", forState: UIControlState.Normal)
        button3.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button3.layer.cornerRadius = 4.0
        button3.layer.borderWidth = 1

        button3.tag = 3
        
        
        let showMsg = UILabel() as UILabel
        showMsg.frame = CGRectMake(width/2, 500, 400, 50)
        showMsg.text = "no action"
        
        
        // 定义 cancel、ok、save、delete、reset 的 UIAlertAction
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default){
            (action: UIAlertAction!) -> Void in
            print("you choose ok")
            showMsg.text = "you choose ok"
        }
        let saveAction = UIAlertAction(title: "save", style: UIAlertActionStyle.Default){
            (action: UIAlertAction!) -> Void in
            print("you choose save")
            showMsg.text = "you choose save"
        }
        let deleteAction = UIAlertAction(title: "delete", style: UIAlertActionStyle.Destructive){
            (action: UIAlertAction!) -> Void in
            print("you choose delete")
            showMsg.text = "you choose delete"
        }
        let resetAction = UIAlertAction(title: "reset", style: UIAlertActionStyle.Destructive){
            (action: UIAlertAction!) -> Void in
            print("you choose reset")
            showMsg.text = "you choose reset"
        }
        
        // 1、初始化最简单的 Alert
        alert1 = UIAlertController(title: "simple alert", message: "this is a simple alert", preferredStyle: UIAlertControllerStyle.Alert)
        alert1.addAction(cancelAction)
        alert1.addAction(resetAction)
        alert1.addAction(okAction)
        
        // 2、初始化带文本框的 Alert
        alert2 = UIAlertController(title: "login alert", message: "please enter your name and password", preferredStyle: UIAlertControllerStyle.Alert)
        alert2.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "name"
            
        }
        alert2.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "password"
            textField.secureTextEntry = true
        }
        let loginAction = UIAlertAction(title: "login", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            
            let msg = (self.alert2.textFields?.first?.text )! + (self.alert2.textFields?.last?.text)!
//            let msg = "show nothing"
            
            showMsg.text = msg
            
            if(((self.alert2.textFields?.isEmpty) == nil)) {
                let name = (self.alert2.textFields?.first)! 
                //   let pwd = (self.alert2.textFields?.last)! as UITextField
                //            let password = self.alert2.textFields!.last! as UITextField
                
                showMsg.text = "name:\(name.text);"
                //            print("name : \(name.text); password : \(pwd.text)")
            } else {
                //                showMsg.text = "nothing"
            }
            
        }
        alert2.addAction(loginAction)
        
        // 3、初始化上拉菜单
        actionSheet = UIAlertController(title: "simple action sheet", message: "action sheet message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(saveAction)
        
        
       
        
//        self.view.addSubview(backBtn)
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(showMsg)
        
        
        
        
    }
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    /// 按钮响应事件
    func buttonAction(sender: UIButton) {
        let num = sender.tag
        switch num {
        case 1:
            self.presentViewController(alert1, animated: true, completion: nil)
        case 2:
            self.presentViewController(alert2, animated: true, completion: nil)
        case 3:
            self.presentViewController(actionSheet, animated: true, completion: nil)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
