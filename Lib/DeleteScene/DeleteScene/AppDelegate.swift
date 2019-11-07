//
//  AppDelegate.swift
//  DeleteScene
//
//  Created by chao jie deng on 2019/11/6.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = ViewController.init()
        window?.makeKeyAndVisible()
        return true
    }




}

