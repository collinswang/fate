//
//  ssViewController.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import UIKit
// import ChengguHelper

class ssViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    var pickerView: UIPickerView!
    var txt = UITextField()
    var phone = UITextField()
    var info = UITextView()
    
    var month = [String]()
//    var week = [String]()
    var year = [String]()
    var hour = [String]()
    var day = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 初始化数据
        month = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
      //  week = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        hour = ["子时","丑时","寅时","卯时","辰时","巳时","午时","未时","申时","酉时","戌时","亥时"]
        day = ["初一","初二","初三","初四","初五","初六","初七","初八","初九","初十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十","廿一","廿二","廿三","廿四","廿五","廿六","廿七","廿八","廿九","三十"]
        
        for var index=1924; index < 2020; ++index {
            year.append("\(index)年" )
        }
        
        let indexYear = year.indexOf("2015年")
        print("2015年的index是\(indexYear)")
        
        
        let width = self.view.frame.width
        
        self.navigationItem.title = "称骨算命"
        let backItem:UIBarButtonItem = UIBarButtonItem(title: "< 返回", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backItem
        
        let navigationBar = UINavigationBar()
        navigationBar.frame = CGRectMake(0, 0, width, 60)
        navigationBar.pushNavigationItem(self.navigationItem, animated: false)
        
        self.view.addSubview(navigationBar)
           
        
        txt.frame = CGRectMake(width/2-100, 100, 200, 30)
        txt.placeholder = "请输入用户名"
        txt.layer.cornerRadius = 4.0
        txt.layer.borderWidth = 1
        self.view.addSubview(txt)
        
        
        
        phone.frame = CGRectMake(width/2-100, 150, 200, 30)
        phone.placeholder = "请输入手机号码"
        phone.layer.cornerRadius = 4.0
        phone.layer.borderWidth = 1
//        phone.borderStyle = UITextBorderStyle.RoundedRect;
        self.view.addSubview(phone)
        
        pickerView = UIPickerView(frame: CGRectMake(0, 200, width, 50))
        pickerView.delegate = self
        pickerView.dataSource = self
        self.view.addSubview(pickerView)
        pickerView.selectRow(indexYear!, inComponent: 0, animated: false)
        
        let btn = UIButton(type: .System)
        btn.frame = CGRectMake(width/2-100, 350, 200, 30)
        btn.setTitle("算命", forState: UIControlState.Normal)
        btn.layer.cornerRadius = 4.0
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: "getFate", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        info.frame = CGRectMake(20, 400, width-40, 300)
        info.layer.cornerRadius = 4.0
        info.layer.borderWidth = 1
        info.editable = false
        info.layer.borderColor = UIColor.purpleColor().CGColor
        self.view.addSubview(info)
        
      
        
        self.view.backgroundColor = UIColor.whiteColor();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func getFate() {
        let yearIndex = pickerView.selectedRowInComponent(0)
        let monthIndex = pickerView.selectedRowInComponent(1)
        let weekIndex = pickerView.selectedRowInComponent(2)
        let hourIndex = pickerView.selectedRowInComponent(3)
        
//        print(yearIndex)
        let cgu: ChengguHelper = ChengguHelper()
        let resu = cgu.gu(yearIndex+1, month: monthIndex+1, day: weekIndex+1, hour: hourIndex+1)
        
        
//        let msg = txt.text! + phone.text! + year[yearIndex] + month[monthIndex] + day[weekIndex] + hour[hourIndex]
        info.text = resu.msg + "\n" + resu.res
//        print(resu)
    }
    
    // 设置列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
    
    
    
    // 设置行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0) {
            return year.count
        }
        if(component == 1){
            return month.count
        }
        if(component == 2){
            return day.count
        }
        if(component == 3){
            return hour.count
        }
        return 0
    }
    
    // 设置每行具体内容（titleForRow 和 viewForRow 二者实现其一即可）
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return year[row]
        }
        if(component == 1){
            return month[row]
        }
        if(component == 2){
            return day[row]
        }
        if(component == 3){
            return hour[row]
        }
        return ""
    }
    
    // 选中行的操作
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
//            print("year selected: \(year[row])")
        }
        if(component == 1){
//            print("month selected: \(month[row])")
        }
        if(component == 2){
//            print("week selected: \(day[row])")
        }
        if(component == 3){
//            print("hour selected: \(hour[row])")
        }
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
