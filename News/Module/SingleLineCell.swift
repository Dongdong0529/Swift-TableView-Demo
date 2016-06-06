//
//  SingleLineCell.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class SingleLineCell: TableViewCell {
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont.systemFontOfSize(15)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateRow(row: TableViewRow) {
        super.updateRow(row)
        let single = row.data as! SingleModel
        titleLabel.text = single.title! as String
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRectMake(15, (CGRectGetHeight(self.bounds) - 15) / 2, ScreenWidth - 30, 15)
    }
}
