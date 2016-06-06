//
//  Shakeable.swift
//  News
//
//  Created by Dongdong on 16/6/2.
//  Copyright © 2016年 com. All rights reserved.
//

import Foundation
import UIKit

protocol Shakeable {}

//where Self:UIView
// MARK: - 遵守该协议的class必须是UIView的子类才可以使用协议内的方法

extension Shakeable where Self:UIView {
    func shake() {
        let shakeAnimation:CABasicAnimation = CABasicAnimation(keyPath:"position")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 5
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = NSValue(CGPoint: CGPointMake(centerX - 4, originY))
        shakeAnimation.toValue = NSValue(CGPoint: CGPointMake(centerX + 4, originY))
        layer.addAnimation(shakeAnimation, forKey: "shakeAnimation")
    }
}

protocol Rotationable {}

extension Rotationable where Self:UIView {
    func rotationAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 1
        animation.repeatCount = 2
        animation.autoreverses = false
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        layer.addAnimation(animation, forKey: "rotationAnimtion")
    }
}

protocol ScaleAnimation {}

extension ScaleAnimation where Self:UIView {
    func scaleAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 1
        animation.repeatCount = 2
        animation.autoreverses = false
        animation.fromValue = 1
        animation.toValue = 2
        layer.addAnimation(animation, forKey: "scaleAnimtion")
    }
}

class CustomButton:UIButton,Shakeable,Rotationable {}
class CustomImageView: UIImageView, Rotationable,ScaleAnimation {}
