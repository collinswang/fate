//
//  ZhuanPanController.swift
//  fate
//
//  Created by xieyang on 15/12/1.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ZhuanPanController: UIViewController {
    
    var popView = UIView()
    var labPrise = UILabel()
    var btn = UIButton(type: .System)
    var zhuanpan = UIImageView()
    var strPrise = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        self.view.backgroundColor = UIColor.whiteColor()

        self.title = "转盘"
        
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.redColor()
        self.view.addSubview(navigationBar)

        //背景
        let bcImg = UIImage(named:"bg")
        let imgViewBg = UIImageView(frame: CGRectMake(0, 60, width, height-60))
        imgViewBg.image = bcImg
        self.view.addSubview(imgViewBg)
        
        
        //转盘
        zhuanpan.frame = CGRectMake((width-280)/2, 90, 280, 280)
        zhuanpan.image = UIImage(named:"zhuanpan")
        self.view.addSubview(zhuanpan)
        
        //手指
        let hander = UIImageView(frame: CGRectMake(0, 80, 40, 40))
        hander.center = CGPointMake(zhuanpan.center.x, zhuanpan.center.y-25)
        hander.image = UIImage(named:"hander")
//        hander.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(hander)

        
        labPrise.frame = CGRectMake(CGRectGetMinX(zhuanpan.frame), CGRectGetMaxY(zhuanpan.frame)+50, CGRectGetWidth(zhuanpan.frame), 20)
        labPrise.textColor = UIColor.orangeColor()
        labPrise.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labPrise)
        
        
        btn = UIButton(type: .System)
        btn.frame = CGRectMake((width-200)/2, CGRectGetMaxY(labPrise.frame)+50, 200, 35)
        btn.setTitle("开始", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.orangeColor()
        btn.layer.borderColor = UIColor.orangeColor().CGColor
        btn.layer.borderWidth = 1.0
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: "btnclick", forControlEvents: UIControlEvents.TouchUpInside)
       
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnclick(){
        var angle: Int
        let randomNum = arc4random()%100
        if (randomNum > 90 && randomNum <= 99) {
            angle = 300
            strPrise = "一等奖"
        } else if (randomNum > 75 && randomNum <= 90) {
            angle = 60;
            strPrise = "二等奖";
        } else if (randomNum > 50 && randomNum <= 75) {
            angle = 180;
            strPrise = "三等奖";
        } else {
            angle = 240;
            strPrise = "没中奖";
        }
        
        btn.setTitle("抽奖中", forState: UIControlState.Normal)
        labPrise.text = "等待开奖结果"
        btn.enabled = false
        
//        CABasicAnimation rotationAnimation;
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")

        let leg = (Double(angle)*M_PI/180)
        rotationAnimation.toValue = leg
//        rotationAnimation.t
        rotationAnimation.duration = 1.0
        rotationAnimation.cumulative = true;
        rotationAnimation.delegate = self;
        rotationAnimation.fillMode=kCAFillModeForwards;
        rotationAnimation.removedOnCompletion = false

        zhuanpan.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        
    }
    
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
   
        
        UIView.animateWithDuration(5, animations: {
            
            let width = self.view.frame.width
            let height = self.view.frame.height
            
            self.popView = UIView(frame: CGRectMake(0,0,width,height))
            self.popView.backgroundColor = UIColor.clearColor()
            self.popView.transform = CGAffineTransformMakeScale(2, 2);
            self.view.addSubview(self.popView)
            

            let popImageView = UIImageView(frame: CGRectMake(100, 200, width-200, width-200))
            popImageView.image = UIImage(named:"prise.png")
            self.popView.addSubview(popImageView)
            
            
            }, completion: {(finished: Bool) -> Void in
                
                    self.popView.removeFromSuperview()
                    self.labPrise.text = "中奖结果: \(self.strPrise)"
                    self.btn.setTitle("开始抽奖", forState: UIControlState.Normal)
                    self.btn.enabled = true
               
        })
        
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
