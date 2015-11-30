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
    
    let text = UITextView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg = self.base.cacheGetString("msg")
        
        let width = self.view.frame.width
        
        self.navigationItem.title = msg
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
//        self.navigationItem.leftBarButtonItems?.append(backItem)
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
        
    
        let btnQian = UIButton(type: .System)
        btnQian.setTitle("求签", forState: UIControlState.Normal)
        btnQian.frame = CGRectMake(width/2-50, 80, 100, 30)
        btnQian.addTarget(self, action: "showMsg", forControlEvents: UIControlEvents.TouchUpInside)
        btnQian.layer.borderWidth = 1
        btnQian.layer.cornerRadius = 4.0
        self.view.addSubview(btnQian)
        
         
        text.frame = CGRectMake(10, 150, width-20, 400)
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
        
        
        let path = NSBundle.mainBundle().pathForResource("Linqian.plist", ofType: nil)
        let myDict = NSDictionary(contentsOfFile: path!)
       
        print("\n---------------------------\n", terminator: "")
        let showMsg = myDict?.objectForKey("\(num)") as! String
        
        
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
