//
//  TableDetail.swift
//  fate
//
//  Created by xieyang on 15/12/7.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class TableDetail: UIViewController {
    
    var base: bassClass = bassClass()
    
    var json: JSON = JSON.null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg = self.base.cacheGetString("msg")
        self.view.backgroundColor = UIColor.whiteColor()
        
        let json: JSON = JSON(data: msg.dataUsingEncoding(NSUTF8StringEncoding)!)
//        print("\(json["userName"].string)---\(json.type)")
        
        let width = self.view.frame.width

        self.navigationItem.title = json["name"].string
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style:  .Plain, target: self, action: "back")
        //        let addItem:UIBarButtonItem = UIBarButtonItem(title: "add", style: UIBarButtonItemStyle.Plain, target: self, action: "rightBarButtonItemClicked")
        self.navigationItem.leftBarButtonItem = backItem
        //        self.navigationItem.leftBarButtonItems?.append(backItem)
        //        self.navigationItem.leftBarButtonItems?.append(addItem)
        
        //        let ui
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
//        print(json)
        
        self.view.addSubview(navigationBar)
        
//        let textArea = UITextView(frame: CGRectMake(width/8, 80, width*3/4, 300))
//        textArea.text = String(json)
//        textArea.editable = false
//        self.view.addSubview(textArea)
        
        
        let imgeView = UIImageView(frame: CGRectMake(0, 80, 400, 400))
        let img = String(json["image"].string!)
        let url = "http://img1.ccjoin.com/\(img)"
        let nsd = NSData(contentsOfURL:NSURL(string: url)!)
        imgeView.image = UIImage(data: nsd!)
        self.view.addSubview(imgeView)
        
        
        let webView = UIWebView(frame: CGRectMake(0, 480, width, 5000))
        webView.loadHTMLString(json["description"].string!, baseURL: nil)
        self.view.addSubview(webView)
        
    }
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

}
