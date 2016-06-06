//
//  ErrorPopoverRender.swift
//  News
//
//  Created by Dongdong on 16/6/2.
//  Copyright © 2016年 com. All rights reserved.
//

import Foundation
import UIKit

protocol ErrorPopoverRender {
    func presentError()
}

extension ErrorPopoverRender where Self:UIViewController {
    func presentError() {
        print(self)
    }
}