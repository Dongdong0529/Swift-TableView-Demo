//
//  CircleIndicatorView.swift
//  News
//
//  Created by Dongdong on 16/6/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class CircleIndicatorView: UIView {
    
    private let circleLayer = CAShapeLayer()
    private let circleRadius:CGFloat = 20.0
    
    var progress: CGFloat {
        get {
            return circleLayer.strokeEnd
        }
        
        set {
            if newValue < 0 {
                circleLayer.strokeEnd = 0.0
            } else if newValue > 1 {
                circleLayer.strokeEnd = 1.0
            } else {
                circleLayer.strokeEnd = newValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    private func config() {
        progress = 0
        circleLayer.frame = bounds
        circleLayer.lineWidth = 2.0
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.redColor().CGColor
        layer.addSublayer(circleLayer)
        backgroundColor = UIColor.yellowColor()
    }
    
    private func circleFrame() -> CGRect {
        var circleFrame = CGRectMake(0, 0, 2 * circleRadius, 2 * circleRadius)
        circleFrame.origin.x = CGRectGetWidth(bounds) / 2 - circleRadius
        circleFrame.origin.y = CGRectGetHeight(bounds) / 2 - circleRadius
        return circleFrame
    }
    
    private func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: circleFrame())
    }
    
    func reveal() {
        backgroundColor = UIColor.clearColor()
        progress = 1
        circleLayer.removeAnimationForKey("strokeEnd")
        circleLayer.removeFromSuperlayer()
        superview?.layer.mask = circleLayer
        
        let center = CGPointMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds))
        let finalRadius = sqrt(center.x * center.x + center.y * center.y)
        let radiusInset = finalRadius - circleRadius
        let outRect = CGRectInset(circleFrame(), -radiusInset, -radiusInset)
        let toPath = UIBezierPath(ovalInRect: outRect).CGPath
        
        let fromPath = circleLayer.path
        let fromLineWidth = circleLayer.lineWidth
        
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        circleLayer.lineWidth = finalRadius * 2
        circleLayer.path = toPath
        CATransaction.commit()
        
        let widthAnimation = CABasicAnimation(keyPath:"lineWidth")
        widthAnimation.fromValue = fromLineWidth
        widthAnimation.toValue = finalRadius * 2
        
        let pathAnimation = CABasicAnimation(keyPath:"path")
        pathAnimation.fromValue = fromPath
        pathAnimation.toValue = toPath
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 1
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        groupAnimation.animations = [widthAnimation, pathAnimation]
        groupAnimation.delegate = self
        layer.addAnimation(groupAnimation, forKey: "groupAnimation")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        superview?.layer.mask = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.path = circlePath().CGPath
        circleLayer.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
}
