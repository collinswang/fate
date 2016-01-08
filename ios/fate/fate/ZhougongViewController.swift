//
//  ZhougongViewController.swift
//  fate
//
//  Created by xieyang on 15/12/28.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ZhougongViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView?
    var base: bassClass = bassClass()
//    let menuList:Dictionary<String,String> = []
    var menuList:NSDictionary = NSDictionary()
    let cellIdentifier = "myCell"
    var dataArray:Array<String> = []
    var indexArray:Array<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        
        self.navigationItem.title = "动画效果"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        navigationBar.backgroundColor = UIColor.redColor()
        self.view.addSubview(navigationBar)

        
        let path = NSBundle.mainBundle().pathForResource("head.plist", ofType: nil)
        menuList = NSDictionary(contentsOfFile: path!)!
        
        for (i,x) in menuList {
//            print("序号\(i),这里i是nsdictionary中的序号，\(x)就是你的nsdictionary中的对象")
            dataArray.append(x as! String)
            indexArray.append(i as! String)
        }
        
        self.tableView=UITableView(frame:CGRectMake(0, 60, width, height-60),style:UITableViewStyle.Plain)
        // 设置tableView的数据源
        self.tableView!.dataSource=self
        // 设置tableView的委托
        self.tableView!.delegate = self
        //
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return menuList.count
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        var cell:ListTableViewCell! = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as? ListTableViewCell
        
        if (cell == nil) {
            cell = ListTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: self.cellIdentifier)
        }
        cell.lblTitle.text = self.dataArray[indexPath.row]

        
      
        
        return cell
        
    }
    
    
    //选择一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        

        self.base.cacheSetString("msg", value: String(self.indexArray[indexPath.row]))
        self.base.cacheSetString("title", value: String(self.self.dataArray[indexPath.row]))

        self.presentViewController(ZhougongListViewController(), animated: false, completion: nil)
        //        self.pushViewController(TableDetail(), animated: true)
        
    }
    
    func back(){
        //        self.dismissViewControllerAnimated(false, completion: nil)
        self.presentViewController(ViewController(), animated: false, completion: nil)
    }


}
