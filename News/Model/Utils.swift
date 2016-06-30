//
//  Utils.swift
//  News
//
//  Created by Dongdong on 16/6/8.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    var closure1:(()->())?
    var closure2:(Int->())?
    var closure3:(()->Int)?
    
    static let instance: Utils = {
        return Utils()
    }()
    
    func test() {
        print(self)
    }
    
    class func sharedInstance() -> Utils {
        let instance = Utils()
        return instance
    }
}
