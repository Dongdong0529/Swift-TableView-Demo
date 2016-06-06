//
//  TableViewRow.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import Foundation
import UIKit

class TableViewRow: ViewModel {
    var reuseIdentifier:String?
    var height:CGFloat = 0
    
    
    class func row(tag:NSInteger,data:AnyObject,reuseIdentifier:String) -> TableViewRow {
        return self.row(tag, data: data, reuseIdentifier: reuseIdentifier, height: 0)
    }
    
    class func row(tag:NSInteger,data:AnyObject,reuseIdentifier:String,height:CGFloat) -> TableViewRow {
        let row = TableViewRow()
        row.tag = tag
        row.data = data
        row.reuseIdentifier = reuseIdentifier
        row.height = height
        return row
    }
}
