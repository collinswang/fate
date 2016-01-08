//
//  ZhougongDetailViewController.swift
//  fate
//
//  Created by xieyang on 15/12/28.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ZhougongDetailViewController: UIViewController {
    
     var base: bassClass = bassClass()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        let title = base.cacheGetString("title");
        
        self.navigationItem.title = title
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.redColor()
        self.view.addSubview(navigationBar)
        
//        let index = base.cacheGetString("msg")
//
//        let url =  NSURL(string: "http://www.jiemeng.cc\(index)")
        
//        let webView = UIWebView(frame: CGRectMake(0, 60, width, height-60))
//        
//        webView.loadRequest(NSURLRequest(URL: url!))
//        //        webView.loadHTMLString(json["description"].string!, baseURL: nil)
//        self.view.addSubview(webView)
        let fileName = base.cacheGetString("fileName")
        let path = NSBundle.mainBundle().pathForResource("detail-\(fileName)", ofType: "plist")
        let menuList = NSDictionary(contentsOfFile: path!)!
        
        let content = menuList.objectForKey("\(title)")
        
        let showTxt = UITextView(frame: CGRectMake(0, 60, width, height-60))
        showTxt.text = content as! String;
        showTxt.textColor = UIColor.whiteColor()
        //        text.font = UIFont.boldSystemFontOfSize(30)
        showTxt.font = UIFont.systemFontOfSize(20)
        showTxt.editable = false
        showTxt.backgroundColor = UIColor.grayColor()
        self.view.addSubview(showTxt);
        
    }
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
