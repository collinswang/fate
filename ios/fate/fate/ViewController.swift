//
//  ViewController.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var base: bassClass = bassClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIButton.buttonWithType(.System) as! UIButton
        button1.frame = CGRectMake(self.view.frame.width/2-200, 50, 200, 30)
        button1.setTitle("称骨算命", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.tag = 1
        
        
        let button2 = UIButton.buttonWithType(.System) as! UIButton
        button2.frame = CGRectMake(self.view.frame.width/2-200, 150, 200, 30)
        button2.setTitle("观音灵签", forState: UIControlState.Normal)
        button2.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.tag = 2
        
 
        self.view.addSubview(button1)
        self.view.addSubview(button2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction(sender: UIButton) {
        
        let num = sender.tag
        println("haoma \(num)" )

        
        switch num {
        case 1:
            self.presentViewController(ssViewController(), animated: false, completion: nil)
            break
        case 2:
            var txt = sender.titleLabel?.text
            
            self.base.cacheSetString("msg", value: txt!)
            
            self.presentViewController(GuanyinViewController(), animated: false, completion:nil)
            break
        default:
            break
        }
        
        
                
        
    }


}

