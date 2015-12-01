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
        self.title = "算命"
     
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
        
        
        let button1 = UIButton(type: .System)
        button1.frame = CGRectMake(width/2-50, 150, 100, 30)
        button1.setTitle("称骨算命", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.tag = 1
        button1.layer.cornerRadius = 4.0
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.purpleColor().CGColor
        self.view.addSubview(button1)
        
        
        let button2 = UIButton(type: .System)
        button2.frame = CGRectMake(width/2-50, 200, 100, 30)
        button2.setTitle("观音灵签", forState: UIControlState.Normal)
        button2.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.tag = 2
        button2.layer.cornerRadius = 4.0
        button2.layer.borderWidth = 1
        self.view.addSubview(button2)
        
        let button3 = UIButton(type: .System)
        button3.frame = CGRectMake(width/2-50, 250, 100, 30)
        button3.setTitle("alert 事件", forState: UIControlState.Normal)
        button3.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button3.tag = 3
        button3.layer.cornerRadius = 4.0
        button3.layer.borderWidth = 1
        self.view.addSubview(button3)
        
        let button4 = UIButton(type: .System)
        button4.frame = CGRectMake(width/2-50, 300, 100, 30)
        button4.setTitle("显示table", forState: UIControlState.Normal)
        button4.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button4.tag = 4
        button4.layer.cornerRadius = 4.0
        button4.layer.borderWidth = 1
        self.view.addSubview(button4)
        
        let button5 = UIButton(type: .System)
        button5.frame = CGRectMake(width/2-50, 350, 100, 30)
        button5.setTitle("动画效果", forState: UIControlState.Normal)
        button5.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button5.tag = 5
        button5.layer.cornerRadius = 4.0
        button5.layer.borderWidth = 1
        self.view.addSubview(button5)
        
        let button6 = UIButton(type: .System)
        button6.frame = CGRectMake(width/2-50, 400, 100, 30)
        button6.setTitle("转盘", forState: UIControlState.Normal)
        button6.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button6.tag = 6
        button6.layer.cornerRadius = 4.0
        button6.layer.borderWidth = 1
        self.view.addSubview(button6)
        
        let dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        let dateString:String = dateFormatter.stringFromDate(NSDate());
        var dates:[String] = dateString.componentsSeparatedByString("/")
        let currentYear  = dates[0]
        let currentMonth = dates[1]
        let currentDay   = dates[2]
        
         print("\(currentYear):\(currentMonth):\(currentDay)")
        
    
 
     
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
            self.presentViewController(TableViewController(), animated: false, completion: nil)
            break
        case 5:
            self.presentViewController(AnimationController(), animated: false, completion: nil)
            break
        case 6:
            self.presentViewController(ZhuanPanController(), animated: false, completion: nil)
            break
        default:
            break
        }
        
        
    }
    



}

