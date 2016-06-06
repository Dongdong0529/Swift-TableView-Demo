//
//  Present.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import Foundation

class Present: NSObject {
    
    private var rowData0:[TableViewRow] = [TableViewRow]()
    private var rowData1:[TableViewRow] = [TableViewRow]()
    private var rowData2:[TableViewRow] = [TableViewRow]()

    var rowData:[TableViewRow]?
    func getRows(index:NSInteger) {
        switch index {
        case 0:
            rowData = rowData0
        case 1:
            rowData = rowData1
        default:
            rowData = rowData2
        }
    }
    
    override init() {
        super.init()
        var rows0 = [SingleModel]()
        var rows1 = [DoubleModel]()
        var rows2 = [ThreeModel]()
        
        for i in 0 ..< 20 {
            let s = SingleModel()
            s.title = "cell" + "\(i)"
            rows0.append(s)
        }
        
        for i in 0 ..< 20 {
            let d = DoubleModel()
            d.title = "cell" + "\(i)"
            d.detail = "doubleCell"
            rows1.append(d)
        }
        
        for i in 0 ..< 20 {
            let d = ThreeModel()
            d.title = "cell" + "\(i)"
            d.detail = "doubleCell"
            d.describe = "describe + describe + describe"
            rows2.append(d)
        }
        
        buildRow(rows0,index:0)
        buildRow(rows1,index:1)
        buildRow(rows2,index:2)
        rowData = rowData0
    }
    
    func buildRow(data:[AnyObject],index:NSInteger) {
        let block:(tag:NSInteger, data:AnyObject, reuseIdentifier:String) -> TableViewRow = {(tag:NSInteger, data:AnyObject, reuseIdentifier:String) in
            return TableViewRow.row(tag, data: data, reuseIdentifier: reuseIdentifier)
        }
        
        for item in data {
            if index == 0 {
                rowData0.append(block(tag:kSingleLineCellTag, data: item, reuseIdentifier: kSingleLineCell))
            } else if index == 1 {
                rowData1.append(block(tag:kDoubleLineCellTag, data: item, reuseIdentifier: kDoubleLineCell))
            } else {
                rowData2.append(block(tag:-1, data: item, reuseIdentifier: kThreeLineCell))
            }
        }
    }
}
