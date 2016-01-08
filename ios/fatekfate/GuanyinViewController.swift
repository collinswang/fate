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

    
    let imgView = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg = self.base.cacheGetString("msg")
        
        let width = self.view.frame.width
        
        self.navigationItem.title = msg
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.redColor()
        self.view.addSubview(navigationBar)

        
        let label = UILabel(frame: CGRectMake(10, 600, width-20, 50))
        label.text = "摇一摇抽签"
        label.backgroundColor = UIColor.grayColor()
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
   
        
        imgView.frame = CGRectMake(10, 150, width-20, 400)
        imgView.image = UIImage(named:"qian.jpg")
        self.view.addSubview(imgView)

        self.view.backgroundColor = UIColor.whiteColor();
        
        UIApplication.sharedApplication().applicationSupportsShakeToEdit = true
        self.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(){
//        self.dismissViewControllerAnimated(false, completion: nil)
        self.presentViewController(ViewController(), animated: false, completion: nil)
    }
    
    
    func rand(max: Int, min: Int) ->Int{
        return Int(arc4random())%(max-min+1)+min
    }
    
 

    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    
//    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
//        print("begain ...")
//    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
           
            self.presentViewController(ShakeResult(), animated: false, completion: nil)
        }
    }

//    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
//        print("over")
//    }

}
