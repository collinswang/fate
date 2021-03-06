//
//  TableViewController.swift
//  fate
//
//  Created by cullen on 11/28/2015.
//  Copyright © 2015 xieyang. All rights reserved.
//

import UIKit

class TableViewControllerBack: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView?
    var items = ["武汉","上海","北京","深圳","广州","重庆","香港","台海","天津"]
    var leftBtn:UIButton?
    var rightButtonItem:UIBarButtonItem?
    var base: bassClass = bassClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setupRightBarButtonItem()
        initDate()
        //        setupLeftBarButtonItem()
        //        self.leftBtn!.userInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    func initView(){
        //        self.title = "show table"
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        self.navigationItem.title = "列表展示"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        //        let addItem:UIBarButtonItem = UIBarButtonItem(title: "add", style: UIBarButtonItemStyle.Plain, target: self, action: "rightBarButtonItemClicked")
        self.navigationItem.leftBarButtonItem = backItem
        //        self.navigationItem.leftBarButtonItems?.append(backItem)
        //        self.navigationItem.leftBarButtonItems?.append(addItem)
        
        //        let ui
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
        
        
        self.tableView=UITableView(frame:CGRectMake(0, 60, width, height),style:UITableViewStyle.Plain)
        // 设置tableView的数据源
        self.tableView!.dataSource=self
        // 设置tableView的委托
        self.tableView!.delegate = self
        //
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
        //        let backBtn = UIButton(type: .System)
        //        backBtn.setTitle("返回", forState: UIControlState.Normal)
        //        backBtn.frame = CGRectMake(20, 50, 100, 30)
        //        backBtn.addTarget(self,action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        //        backBtn.layer.cornerRadius = 4.0
        //        backBtn.layer.borderWidth = 1
        //
        //        self.view.addSubview(backBtn)
        
        
    }
    //加左边按钮
    //    func setupLeftBarButtonItem() {
    //        self.leftBtn = UIButton(type: .System)
    //        self.leftBtn!.frame = CGRectMake(0,0,50,40)
    //        self.leftBtn?.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    //        self.leftBtn?.setTitle("Edit", forState: UIControlState.Normal)
    //        self.leftBtn!.tag = 100
    //        self.leftBtn!.userInteractionEnabled = false
    //        self.leftBtn?.addTarget(self, action: "leftBarButtonItemClicked", forControlEvents: UIControlEvents.TouchUpInside)
    //        let barButtonItem = UIBarButtonItem(customView: self.leftBtn!)
    //        self.navigationItem.leftBarButtonItem = barButtonItem
    //    }
    //左边按钮事件
    //    func leftBarButtonItemClicked()
    //    {
    //        print("leftBarButton")
    //        if (self.leftBtn!.tag == 100)
    //        {
    //            self.tableView?.setEditing(true, animated: true)
    //            self.leftBtn!.tag = 200
    //            self.leftBtn?.setTitle("Done", forState: UIControlState.Normal)
    //            //将增加按钮设置不能用
    //            self.rightButtonItem!.enabled=false
    //        }
    //        else
    //        {
    //            //恢复增加按钮
    //            self.rightButtonItem!.enabled=true
    //            self.tableView?.setEditing(false, animated: true)
    //            self.leftBtn!.tag = 100
    //            self.leftBtn?.setTitle("Edit", forState: UIControlState.Normal)
    //        }
    //
    //    }
    
    //加右边按钮
    func setupRightBarButtonItem()
    {
        self.rightButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self,action: "rightBarButtonItemClicked")
        self.navigationItem.rightBarButtonItem = self.rightButtonItem
        
    }
    //增加事件
    func rightBarButtonItemClicked()
    {
        
        let row = self.items.count
        let indexPath = NSIndexPath(forRow:row,inSection:0)
        self.items.append("杭州")
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let row=indexPath.row as Int
        cell.textLabel!.text=self.items[row]
        //        cell.imageView!.image = UIImage(named:"green.jpg")
        
        return cell;
        
    }
    
    //删除一行
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        let index=indexPath.row as Int
        self.items.removeAtIndex(index)
        self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        NSLog("删除(indexPath.row)")
    }
    //选择一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //        let message = "你选择的是\(self.items[indexPath.row])"
        
        // 1、初始化最简单的 Alert
        //        let alert1 = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        //        self.presentViewController(alert1, animated: true, completion: nil)
        //        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default){
        //            (action: UIAlertAction!) -> Void in
        //
        //        }
        
        //        let txt = sender.titleLabel?.text
        
        self.base.cacheSetString("msg", value: self.items[indexPath.row])
        self.presentViewController(TableDetail(), animated: false, completion: nil)
        
        
        //        alert1.addAction(okAction)
        
    }
    
    func initDate() {
        let url = "http://172.16.3.53:8080/user/query"
        HttpSwift.get(url, params: ["get": "POST Network"], callback: { (data, response, error) -> Void in
            let string = data
            
            //使用guard判断
            guard error != nil else{
                print(data)
                //                print("GET带参数 请求成功 \(string)")
                self.testJson(string as String)
                return
            }
        })
        
        //        print(url)
    }
    
    
    func testJson(data:String)  {
        if let dataFromString = data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            print("------------------")
            //            let json = JSON(json)
            print(json.type)
            print("------------------")
            let page = json["pager"]["recordCount"]
            print(page)
           
        }
        
    }
    
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
}
