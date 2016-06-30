//
//  AppDelegate.swift
//  News
//
//  Created by Dongdong on 16/5/30.
//  Copyright © 2016年 com. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController = UINavigationController(rootViewController:LiveViewController())
        self.window?.makeKeyAndVisible()
        testNetWork()
        return true
    }

    func testNetWork() {
        var a = 10
        var b = 15
        swapTwoValues(&a,&b)
        print("\(a)--\(b)")
        swap(&a, &b)
        let bird:Bird = Bird(name:"小鸟")
        print(bird.canFly)
        print(bird.name)
        
        let names = ["11","22"]
        let list = test(names) { value -> String in
            return "\(value) + aaaa"
        }
        print(list)
        
        let numbers = [1,2,3,4,5,6]
        
//        let f = numbers.myFilter { $0 > 3}
        
//        let map = numbers.map({ $0 + 2})
        let reduce = numbers.myReduce(0, combine: { $0 + $1})
        print(reduce)
        
        Utils.instance.closure1 = {()->() in
            print("1232131231")
        }
        Utils.instance.closure1?()
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

