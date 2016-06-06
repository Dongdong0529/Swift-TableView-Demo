//
//  UIView+Extension.swift
//  News
//
//  Created by Dongdong on 16/6/2.
//  Copyright © 2016年 com. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var originX:CGFloat {
        get {
            return CGRectGetMinX(frame)
        }
        
        set {
            var rect:CGRect = frame
            rect.origin.x = newValue
            frame = rect
        }
    }
    
    var originY:CGFloat {
        get {
            return CGRectGetMinY(frame)
        }
        set {
            var rect:CGRect = frame
            rect.origin.y = newValue
            frame = rect
        }
    }
    
    var width:CGFloat {
        get {
            return CGRectGetWidth(frame)
        }
        set {
            var rect:CGRect = frame
            rect.size.width = newValue
            frame = rect
        }
    }
    
    var height:CGFloat {
        get {
            return CGRectGetHeight(frame)
        }
        set {
            var rect:CGRect = frame
            rect.size.height = newValue
            frame = rect
        }
    }
    
    var centerX:CGFloat {
        get {
            return center.x
        }
        
        set {
            var newCenter:CGPoint = center
            newCenter.x = newValue
            center = newCenter
        }
    }
    
    var centerY:CGFloat {
        get {
            return center.y
        }
        
        set {
            var newCenter:CGPoint = center
            newCenter.y = newValue
            center = newCenter
        }
    }

    var top:CGFloat {
        get {
            return originY
        }
        
        set {
            originY = newValue
        }
    }
    
    var left:CGFloat {
        get {
            return originX
        }
        
        set {
            originX = newValue
        }
    }
    
    var bottom:CGFloat {
        get {
            return originY + height
        }
        
        set {
            originY = newValue - height
        }
    }
    
    var right:CGFloat {
        get {
            return originX + width
        }
        
        set {
            originX = newValue - width
        }
    }
}
