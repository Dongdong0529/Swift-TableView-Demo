//
//  DoubleLineCell.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class DoubleLineCell: SingleLineCell {
    
    lazy var detailLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(detailLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateRow(row: TableViewRow) {
        super.updateRow(row)
        let double = row.data as! DoubleModel
        detailLabel.text = double.detail! as String
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRectMake(15, 10, ScreenWidth - 30, 15)
        detailLabel.frame = CGRectMake(15, CGRectGetMaxY(titleLabel.frame) + 10, ScreenWidth - 30, 15)
    }
}
