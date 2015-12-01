//
//  AnimationController.swift
//  fate
//
//  Created by xieyang on 15/12/1.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class AnimationController: UIViewController {

    //游戏方格维度
    var dimension:Int = 4
    //数字格子的宽度
    var width:CGFloat = 50
    //格子与格子的间距
    var padding:CGFloat = 6
    
    //保存背景图数据
    var backgrounds:Array<UIView>!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        let width = self.view.frame.width
        
        
        self.navigationItem.title = "动画效果"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
        
        
        
        self.backgrounds = Array<UIView>()
        setupGameMap()
        playAnimation()
    }
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func setupGameMap()
    {
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for i in 0..<dimension
        {
            
            y = 150
            for _ in 0..<dimension
            {
                //初始化视图
                let background = UIView(frame:CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                //将视图保存起来，以备后用
                backgrounds.append(background)
                y += padding + width
            }
            x += padding+width
        }
    }
    
    func playAnimation()
    {
        for tile in backgrounds{
            //先将数字块大小置为原始尺寸的 1/10
            tile.layer.setAffineTransform(CGAffineTransformMakeScale(0.1,0.1))
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animateWithDuration(60, delay:0.01,
                options:UIViewAnimationOptions.TransitionNone, animations:
                {
                    ()-> Void in
                    //在动画中，数字块有一个角度的旋转。
                    tile.layer.setAffineTransform(CGAffineTransformMakeRotation(90))
                },
                completion:{
                    (finished:Bool) -> Void in
                    UIView.animateWithDuration(1, animations:{
                        ()-> Void in
                        //完成动画时，数字块复原
                        tile.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
