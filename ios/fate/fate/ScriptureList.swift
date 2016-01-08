//
//  ScriptureList.swift
//  fate
//
//  Created by xieyang on 15/12/23.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ScriptureList: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    var tableView : UITableView?
    
    let cellIdentifier = "myCell"
    
    var base: bassClass = bassClass()
    
    let menuList = ["《净口业真言》", "《大悲咒》", "《心经》" ,"《礼佛大忏悔文》","《消灾吉祥神咒》","《解结咒》","《准提神咒》",
        "《往生咒》","《七佛灭罪真言》","《补阙真言》","《功德宝山神咒》","《大吉祥天女咒》","《如意宝轮王陀罗尼》","《观音灵感真言》","《圣无量寿决定光明王陀罗尼》","《药师灌顶真言》","《六字真言》"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        self.navigationItem.title = "列表展示"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
        
        
        self.tableView=UITableView(frame:CGRectMake(0, 60, width, height-60),style:UITableViewStyle.Plain)
        // 设置tableView的数据源
        self.tableView!.dataSource=self
        // 设置tableView的委托
        self.tableView!.delegate = self
        //
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
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
        cell.lblTitle.text = self.menuList[indexPath.row]
//        return cell
    
        
        return cell
        
    }
    
    
    //选择一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //        print(String(self.json[indexPath.row]))
        self.base.cacheSetString("index", value: String(indexPath.row+1216))
        self.base.cacheSetString("title", value: self.menuList[indexPath.row])
        
        self.presentViewController(ChangFateViewController(), animated: false, completion: nil)
        
        
        //        self.base.cacheSetJson("jsonmsg", value: self.json[indexPath.row])
//        self.presentViewController(TableDetail(), animated: false, completion: nil)
        //        self.pushViewController(TableDetail(), animated: true)
        
    }

    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    

}
