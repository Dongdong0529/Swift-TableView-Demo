//
//  TableViewCell.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var row:TableViewRow?
    
    func updateRow(row:TableViewRow) {
        self.row = row
    }
}
