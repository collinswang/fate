//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

print(str)


//class st: NSData {
//    
//    
//    struct st {
//        let year:Int
//        let month: Int
//        let day :Int
//       
//        init(year:Int,month:Int, day:Int){
//            self.year = year
//            self.month = month
//            self.day = day
//            
//            print("result:\(year)-\(month)-\(day) ")
//        }
//        
//    }
//    
//    func showToday() {
//        
//        print("today")
//    }
//}

//class test2 {
//    var year:Int
//    var month:Int
//    var day:Int
//    
//    init(year:Int, month:Int, day:Int) {
////        super.init()
//        self.year = year
//        self.month = month
//        self.day = day
////        super.init()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    func showToday(){
//        print("result:\(year)-\(month)-\(day) ")
//    }
//    
//    
//}





//st().showToday()

//st.st.init(year: 1990, month: 12, day: 1)
//st.init
// let txt2 = test2(year: 1990, month: 11, day: 1)
//txt2.showToday()

//var now = NSDate()
//var dateFormatter1 = NSDateFormatter()
//var dateFormatter2 = NSDateFormatter()
//dateFormatter2.dateFormat = "yyyy-MM-dd-HH-mm-ss"
//// Date 转 String
//var nowString = dateFormatter2.stringFromDate(now)

//print(nowString)
//var dates = nowString.componentsSeparatedByString("-")
//print(dates)
//
//var changeString = "1990-1-31"
//dateFormatter1.dateFormat = "yyyy-MM-dd"
//now = dateFormatter1.dateFromString(changeString)!
//print(now.timeIntervalSince1970)
//print(now.timeIntervalSinceReferenceDate)
//print(now.timeIntervalSinceNow)
//
//// print(now.timeIntervalSinceDate(NSDate()))
//print("\n")
//func getCurrentTime() -> String {
//    let formatter: NSDateFormatter = NSDateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    let dateTime: String = formatter.stringFromDate(NSDate())
////    self.startTime = dateTime
//    print(dateTime)
//    return dateTime
//}
//


// print(res)



//测试json
//func testJson(user:AnyObject) {
//    //Swift对象
////    let user = [
////        "uname": "张三",
////        "tel": ["mobile": "138", "home": "010"]
////    ]
//    //首先判断能不能转换
//    if (!NSJSONSerialization.isValidJSONObject(user)) {
//        print("is not a valid json object")
//        return
//    }
//    //利用OC的json库转换成OC的NSData，
//    //如果设置options为NSJSONWritingOptions.PrettyPrinted，则打印格式更好阅读
//    let data : NSData! = try? NSJSONSerialization.dataWithJSONObject(user, options: [])
//    //NSData转换成NSString打印输出
//    let str = NSString(data:data, encoding: NSUTF8StringEncoding)
//    //输出json字符串
//    print("Json Str:"); print(str)

    //把NSData对象转换回JSON对象
//    let json : AnyObject! = try? NSJSONSerialization
//        .JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments)
//    print("Json Object:"); print(json)
//    
//    let page: AnyObject = json.objectForKey("pager")!
//    
//    print(page.objectForKey("pageSize"))
//    
//    let list:AnyObject = json.objectForKey("list")!
//    print(list.)
    
    
    //验证JSON对象可用性
//    let uname : AnyObject = json.objectForKey("uname")!
//    let mobile : AnyObject = json.objectForKey("tel")!.objectForKey("mobile")!
//    print("get Json Object:"); print("uname: \(uname), mobile: \(mobile)")
//}



//let strs = ["list":[["id":1,"userNo":"1","userName":"superAdmin","createBy":1,"updateBy":1,"createTime":"2015-06-12 10:34:11","updateTime":"2015-06-12 10:34:11","telephone":"55555555555","password":"4297F44B13955235245B2497399D7A93","state":0,"lastLoginTime":"2015-11-30 09:54:57","lastLoginIp":"127.0.0.1","orgId":11,"cityList":"41,253"], ["id":2,"userName":"admin","createBy":2,"updateBy":2,"createTime":"2015-06-12 10:34:11","updateTime":"2015-06-12 10:34:11","telephone":"55555555555","password":"937084B0FD90B6D17F118AB1CD0B9608","state":0,"lastLoginTime":"2015-10-15 10:27:15","lastLoginIp":"172.16.8.16","orgId":11], ["id":183,"userName":"test009","createBy":2,"updateBy":2,"createTime":"2015-10-15 09:56:44","updateTime":"2015-10-15 09:56:44","telephone":"12345678900","password":"4297F44B13955235245B2497399D7A93","state":0,"lastLoginTime":"2015-10-15 10:00:01","lastLoginIp":"172.16.8.23","orgId":226,"cityList":"221"], ["id":167,"userName":"100006","createBy":1,"updateBy":2,"createTime":"2015-08-18 14:01:31","updateTime":"2015-08-19 13:48:01","telephone":"11111111111","password":"E10ADC3949BA59ABBE56E057F20F883E","state":0,"orgId":11,"cityList":"1"], ["id":168,"userName":"100009","createBy":1,"updateBy":2,"createTime":"2015-08-18 14:01:49","updateTime":"2015-08-19 13:47:57","telephone":"11111111111","password":"E10ADC3949BA59ABBE56E057F20F883E","state":0,"orgId":11,"cityList":"1"], ["id":169,"userName":"100008","createBy":1,"updateBy":2,"createTime":"2015-08-18 14:02:11","updateTime":"2015-08-27 13:54:17","telephone":"11111111111","password":"E10ADC3949BA59ABBE56E057F20F883E","state":0,"orgId":11,"cityList":"1"]],"pager":["pageNumber":1,"pageSize":20,"pageCount":1,"recordCount":14]]
//
//testJson(strs)
func checkup(person: [String: String!]) {
    
    // 检查身份证，如果身份证没带，则不能进入考场
    guard let id = person["id"] else {
        print("没有身份证，不能进入考场!")
        return
    }
    
    // 检查准考证，如果准考证没带，则不能进入考场
    guard let examNumber = person["examNumber"] else {
        print("没有准考证，不能进入考场!")
        return
    }
    
    // 身份证和准考证齐全，方可进入考场
    print("您的身份证号为:\(id)，准考证号为:\(examNumber)。请进入考场!")
    
}
checkup(["id": "123456"]) // 没有准考证，不能进入考场!
checkup(["examNumber": "654321"]) // 没有身份证，不能进入考场!
checkup(["id": "123456", "examNumber": "654321"])