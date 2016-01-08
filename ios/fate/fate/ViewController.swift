//
//  ViewController.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var base: bassClass = bassClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        self.title = "命运"
        
     
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
//        navigationBar.backgroundColor = UIColor.redColor()
        
//        navigationBar.tintColor = UIColor.blackColor	()
        
//        navigationBar.alpha = 0.3
//        navigationBar.translucent = true
        navigationBar.barStyle = UIBarStyle.Black
        
        
        self.view.addSubview(navigationBar)
        self.view.backgroundColor = UIColor.whiteColor()
        
        let bWidth = width*1/2-12.5;
        
        let button1 = UIButton(type: .System)
        button1.frame = CGRectMake(10, 275, bWidth, 100)
        button1.setTitle("称骨算命", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.tag = 1
//        button1.layer.cornerRadius = 4.0
//        button1.layer.borderWidth = 1
//        button1.layer.borderColor = UIColor.purpleColor().CGColor
        button1.backgroundColor = UIColor.lightGrayColor()
        button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(button1)
        
        
        let button2 = UIButton(type: .System)
        button2.frame = CGRectMake(width*1/2+2.5, 275, bWidth, 100)
        button2.setTitle("观音灵签", forState: UIControlState.Normal)
        button2.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.tag = 2
        button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button2.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(button2)
        
        let button3 = UIButton(type: .System)
        button3.frame = CGRectMake(10, 380,  bWidth, 100)
        button3.setTitle("alert 事件", forState: UIControlState.Normal)
        button3.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button3.tag = 3
        button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button3.backgroundColor = UIColor.lightGrayColor()
//        button3.layer.borderWidth = 1
//        button3.layer.borderColor = UIColor.purpleColor().CGColor
        self.view.addSubview(button3)
        
        let button4 = UIButton(type: .System)
        button4.frame = CGRectMake(width*1/2+2.5, 380,  bWidth, 100)
        button4.setTitle("逆天改命", forState: UIControlState.Normal)
        button4.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button4.tag = 4
        button4.backgroundColor = UIColor.lightGrayColor()
        button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(button4)
        
        let button5 = UIButton(type: .System)
        button5.frame = CGRectMake(10, 485,  bWidth, 100)
        button5.setTitle("周公解梦", forState: UIControlState.Normal)
        button5.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button5.tag = 5
        button5.backgroundColor = UIColor.lightGrayColor()
        button5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(button5)
        
        let button6 = UIButton(type: .System)
        button6.frame = CGRectMake(width*1/2+2.5, 485,  bWidth, 100)
        button6.setTitle("转盘", forState: UIControlState.Normal)
        button6.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button6.tag = 6
        button6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button6.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(button6)
        
        let button7 = UIButton(type: .System)
        button7.frame = CGRectMake(10, 485,  bWidth, 100)
        button7.setTitle("扫码", forState: UIControlState.Normal)
        button7.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button7.tag = 7
        button7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button7.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(button7)
        
        let ns:Date  = Date()
        
        let str = ns.getTodayInfo()
        
        let textV = UITextView()
        textV.frame = CGRectMake(10, 100, width-20, 170)
//        textV.layer.cornerRadius = 4.0
//        textV.layer.borderWidth = 1
//        textV.layer.borderColor = UIColor.purpleColor().CGColor
        textV.text = str
        textV.font = UIFont.boldSystemFontOfSize(20)
        textV.backgroundColor = UIColor.lightGrayColor()
        textV.textColor = UIColor.whiteColor()
        textV.editable = false
        textV.textAlignment = NSTextAlignment.Center
        self.view.addSubview(textV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction(sender: UIButton) {
        
        let num = sender.tag
                
        switch num {
        case 1:
            self.presentViewController(ssViewController(), animated: false, completion: nil)
            break
        case 2:
            let txt = sender.titleLabel?.text
            
            self.base.cacheSetString("msg", value: txt!)
            
            self.presentViewController(GuanyinViewController(), animated: false, completion:nil)
            break
        case 3:
            self.presentViewController(AlertViewControlller(), animated: false, completion: nil)
            break
        case 4:
            self.presentViewController(ScriptureList(), animated: false, completion: nil)
            break
        case 5:
            self.presentViewController(ZhougongViewController(), animated: false, completion: nil)
            break
        case 6:
            self.presentViewController(ZhuanPanController(), animated: false, completion: nil)
            break
        case 7:
            self.presentViewController(QRViewController(), animated: false, completion: nil)
            break
        default:
            break
        }
        
        
    }
    



}

