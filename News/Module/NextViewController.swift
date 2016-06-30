//
//  NextViewController.swift
//  News
//
//  Created by Dongdong on 16/6/2.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, ErrorPopoverRender {
    
    private lazy var button:CustomButton = {
        let btn:CustomButton = CustomButton(type:.Custom)
        btn.setTitle("按钮", forState: .Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btn.backgroundColor = UIColor.yellowColor()
        btn.frame = CGRectMake(60, 100, 100, 40)
        btn.addTarget(self, action: #selector(NextViewController.tapAction(_:)), forControlEvents: .TouchUpInside)
        return btn
    }()
    
    private lazy var animationView:CustomImageView = {
        let imageView:CustomImageView = CustomImageView()
        imageView.frame = CGRectMake(60, 200, 100, 40)
        imageView.backgroundColor = UIColor.yellowColor()
        return imageView
    }()
    
    let circle = CircleIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(button)
        self.view.addSubview(animationView)
        
        circle.frame = CGRectMake(200, 300, 100, 100);
        circle.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
        self.view.addSubview(circle)
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(NextViewController.addProgress(_ :)), userInfo: nil, repeats: true)
    }
    
    func addProgress(timer: NSTimer) {
        circle.progress += 0.1
        if circle.progress == 1 {
            timer.invalidate()
            circle.reveal()
        }
    }
    
    func tapAction(action:CustomButton) {
        button.shake()
        animationView.rotationAnimation()
        animationView.scaleAnimation()
        presentError()
    }
}
