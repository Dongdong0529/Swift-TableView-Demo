//
//  ThreeLineCell.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class ThreeLineCell: DoubleLineCell {
    private lazy var describeLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(describeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateRow(row: TableViewRow) {
        super.updateRow(row)
        let three = row.data as! ThreeModel
        describeLabel.text = three.describe! as String
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRectMake(15, 10, ScreenWidth - 30, 15)
        detailLabel.frame = CGRectMake(15, CGRectGetMaxY(titleLabel.frame) + 10, ScreenWidth - 30, 15)
        describeLabel.frame = CGRectMake(15, CGRectGetMaxY(detailLabel.frame) + 10, ScreenWidth - 30, 13)
    }
}
