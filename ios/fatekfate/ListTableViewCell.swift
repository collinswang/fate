//
//  ListTableViewCell.swift
//  fate
//
//  Created by xieyang on 15/12/23.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    var lblTitle = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lblTitle = UILabel(frame: CGRectZero)
        lblTitle.font = UIFont(name: "HelveticaNeue-Light", size: 18.0)
        lblTitle.textAlignment = NSTextAlignment.Left
        lblTitle.numberOfLines = 1
        lblTitle.backgroundColor = UIColor.clearColor()
        lblTitle.textColor = UIColor(red: 130/255, green: 137/255, blue: 141/255, alpha: 1.0)
        self.contentView.addSubview(self.lblTitle)
        // 130 137 141
        self.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: -100)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let marginX = CGFloat(30.0)
        let marginY = CGFloat(0.0)
        let width = CGFloat(320)
        let height = self.contentView.frame.size.height
        
        self.lblTitle.frame = CGRectMake(marginX, marginY, width, height)
        
    }

 
}
