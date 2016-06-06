//
//  TableViewSection.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class TableViewSection: TableViewRow {
    var header:NSString?
    var footer:NSString?
    var rows:[TableViewRow]?
    
    class func section(rows:[TableViewRow]) -> TableViewSection?{
        return self.section(rows, header: nil, footer: nil)
    }
    
    class func section(rows:[TableViewRow],header:NSString?,footer:NSString?) -> TableViewSection? {
        let section = TableViewSection()
        section.header = header
        section.footer = footer
        section.rows = rows
        return section
    }
}
