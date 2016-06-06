//
//  MYRefreshGifHeader.swift
//  News
//
//  Created by Dongdong on 16/5/31.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class MYRefreshGifHeader: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        
        stateLabel.hidden = false
        lastUpdatedTimeLabel.hidden = true
        ignoredScrollViewContentInsetTop = 10
        
        setImages([UIImage(named:"v2_pullRefresh1")!], forState: .Idle)
        setImages([UIImage(named:"v2_pullRefresh2")!,], forState: .Pulling)
        setImages([UIImage(named:"v2_pullRefresh1")!,UIImage(named:"v2_pullRefresh2")!], forState: .Refreshing)
        
        setTitle("下拉刷新", forState: .Idle)
        setTitle("松手开始刷新", forState: .Pulling)
        setTitle("正在刷新", forState: .Refreshing)
    }
}
