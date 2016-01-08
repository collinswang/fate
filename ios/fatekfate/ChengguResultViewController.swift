//
//  EFAnimationViewController.swift
//  fate
//
//  Created by xieyang on 15/12/1.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ChengguResultViewController: UIViewController {
    
    var base: bassClass = bassClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg = base.cacheGetString("res")
        let title = base.cacheGetString("title")
        let width = self.view.frame.width
//        let height = self.view.frame.height
        
        self.navigationItem.title = title
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.lightGrayColor()
        navigationBar.backgroundColor = UIColor.redColor()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(navigationBar)

        
        let text = UITextView()
        text.frame = CGRectMake(10, 100, width-20, 400)
        text.backgroundColor = UIColor.lightGrayColor()
        text.text = msg
        text.font = UIFont.systemFontOfSize(20)
        text.textColor = UIColor.whiteColor()
        self.view.addSubview(text)
        
        
        let btn = UIButton(type: .System)
        btn.frame = CGRectMake(10, 520, width-20, 60)
        btn.setTitle("再来一次", forState: UIControlState.Normal)
//        btn.layer.cornerRadius = 4.0
//        btn.layer.borderWidth = 1
        btn.backgroundColor = UIColor.lightGrayColor()
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "again", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func again() {
        self.presentViewController(ssViewController(), animated: false, completion: nil)
    }
    
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
