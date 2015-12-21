//
//  TableViewController.swift
//  fate
//
//  Created by cullen on 11/28/2015.
//  Copyright © 2015 xieyang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView?
    var leftBtn:UIButton?
    var rightButtonItem:UIBarButtonItem?
    var base: bassClass = bassClass()
    
    var json: JSON = JSON.null
    var pager: JSON = JSON.null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDate()
        initView()
    }
    
    func initView(){
       
        let width = self.view.frame.width
        let height = self.view.frame.height
        self.navigationItem.title = "列表展示"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem

       
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
        
    }

    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        switch self.json.type {
        case Type.Array, Type.Dictionary:
            return self.json.count
        default:
            return 1
        }
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        
        let row = indexPath.row

        switch self.json.type {
        case .Array:
            cell.textLabel?.text = json[row]["name"].string
            cell.detailTextLabel?.text = json[row]["description"].string
            let img = String(json[row]["image"].string!)
            let url = "http://img1.ccjoin.com/\(img)"
            let nsd = NSData(contentsOfURL:NSURL(string: url)!)
            cell.imageView?.image = UIImage(data: nsd!)
            
        case .Dictionary:
//            print("dic")
            let key: AnyObject = Array(self.json.dictionaryValue.keys)[row]
            let value = self.json["name"]
            cell.textLabel?.text = "\(key)"
            cell.detailTextLabel?.text = value.description
        default:
//            print("nothing")
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = self.json.description
        }
        
        return cell
        
    }
    

    //选择一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){

//        print(String(self.json[indexPath.row]))
        
        self.base.cacheSetString("msg", value: String(self.json[indexPath.row]))
//        self.base.cacheSetJson("jsonmsg", value: self.json[indexPath.row])
        self.presentViewController(TableDetail(), animated: false, completion: nil)
//        self.pushViewController(TableDetail(), animated: true)
      
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        print("owqu")
//        
//        var nextController: UIViewController?
//        switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) {
//        case .OrderedSame, .OrderedDescending:
//            nextController = (segue.destinationViewController as! UINavigationController).topViewController
//        case .OrderedAscending:
//            nextController = segue.destinationViewController
//        }
//        
//        if let indexPath = tableView!.indexPathForSelectedRow {
//            let row = indexPath.row
//            var nextJson: JSON = JSON.null
//            switch self.json.type {
//            case .Array:
//                nextJson = self.json[row]
//            case .Dictionary where row < self.json.dictionaryValue.count:
//                let key = Array(self.json.dictionaryValue.keys)[row]
//                if let value = self.json.dictionary?[key] {
//                    nextJson = value
//                }
//            default:
//                print("")
//            }
//            (nextController as! TableDetail).json = nextJson
//            print(nextJson)
//        }
//    }
    
    func initDate() {
        let url = "http://172.16.3.66:8080/goods/query"
        HttpSwift.post(url, callback: { (data, response, error) -> Void in
  
            //使用guard判断
            guard error != nil else {
                
//                print("GET带参数 请求成功")
                if let dataFromString = data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                    var oldJson = JSON(data: dataFromString)
                   // print(oldJson)
                    self.json = oldJson["list"]
                    self.pager = oldJson["pager"]
                    self.tableView?.reloadData()
                }
                
                return
            }
        })
        


       
    }
    
    

    
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
