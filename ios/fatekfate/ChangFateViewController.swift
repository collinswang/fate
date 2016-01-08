//
//  ChangFateViewController.swift
//  fate
//
//  Created by xieyang on 15/12/23.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ChangFateViewController: UIViewController {
    
     var base: bassClass = bassClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = self.base.cacheGetString("title")
        print(title)
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        self.navigationItem.title = title
        self.view.backgroundColor = UIColor.whiteColor()
        
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)

        
//        print("index:\(index)")
//        let num = Int(index)! + 1215
        
//        let url  = "http://info.fzgyh.com/html/jingwen/index.html"
//        let index = self.base.cacheGetString("index")
//        let url =  NSURL(string: "http://info.fzgyh.com/html/jingwen/\(index).html")
        
        let path = NSBundle.mainBundle().pathForResource("\(title)", ofType: "html")
//        let menuList = NSDictionary(contentsOfFile: path!)!
//        
//        let content = menuList.objectForKey("\(title)")
        let nsu = NSURL(fileURLWithPath: path!)
        let content = try? NSString(contentsOfURL: nsu, encoding: NSUTF8StringEncoding)

        
        let webView = UIWebView(frame: CGRectMake(0, 60, width, height-60))
        
//        webView.loadRequest(NSURLRequest(URL: url!))
//        webView.lo
        webView.loadHTMLString(content as! String, baseURL: nil)
        self.view.addSubview(webView)
        
    }
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    

}
