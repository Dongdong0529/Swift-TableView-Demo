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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        self.view.addSubview(animationView)
    }
    
    func tapAction(action:CustomButton) {
        button.shake()
        animationView.rotationAnimation()
        animationView.scaleAnimation()
        presentError()
    }
}
