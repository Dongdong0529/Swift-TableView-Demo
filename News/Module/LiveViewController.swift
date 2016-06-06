//
//  LiveViewController.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    var block:(String->String)?

    private lazy var present:Present = {
        let p = Present()
        return p
    }()
    
    private lazy var tableView:UITableView = {
        let tableView:UITableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.backgroundColor = UIColor.colorWithCustom(245, g: 245, b: 245)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.registerClass(SingleLineCell.self, forCellReuseIdentifier: kSingleLineCell)
        tableView.registerClass(DoubleLineCell.self, forCellReuseIdentifier: kDoubleLineCell)
        tableView.registerClass(ThreeLineCell.self, forCellReuseIdentifier: kThreeLineCell)
        tableView.mj_header = MYRefreshGifHeader(refreshingTarget:self,refreshingAction:#selector(LiveViewController.headerRefreshAction(_:)))
        return tableView;
    }()
    
    private lazy var segmentControl:UISegmentedControl = {
        let seg = UISegmentedControl(items:["A","B","C"])
        seg.frame = CGRectMake(15, 6, ScreenWidth - 30, 32)
        seg.selectedSegmentIndex = 0
        seg.addTarget(self, action: #selector(LiveViewController.segmentAction(_:)), forControlEvents: .ValueChanged)
        return seg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
    }
    
    func createHeadView()->UIView {
        let head:UIView = UIView(frame:CGRectMake(0,0,ScreenWidth,44))
        head.backgroundColor = UIColor.colorWithCustom(239, g: 239, b: 244)
        head .addSubview(self.segmentControl)
        return head;
    }
    
    func segmentAction(seg:UISegmentedControl) {
        present.getRows(seg.selectedSegmentIndex)
        tableView.reloadData()
    }
    
    func headerRefreshAction(action:AnyObject?) {
        let time:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) { 
            self.tableView.mj_header.endRefreshing()
        }
    }
}

extension LiveViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (present.rowData?.count)!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = present.rowData![indexPath.row] as TableViewRow
        switch row.tag {
        case 10086:
            return 44
        case 10087:
            return 64
        default:
            return 84
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = present.rowData![indexPath.row] as TableViewRow
        let cell = tableView.dequeueReusableCellWithIdentifier(row.reuseIdentifier!)! as! TableViewCell
        cell.updateRow(row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeadView()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}