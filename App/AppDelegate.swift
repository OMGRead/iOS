//
//  AppDelegate.swift
//  App
//
//  Created by Remi Robert on 21/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var appCoordinator: AppCoordinator = AppCoordinator(window: self.window!)
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.initStyle()
        self.appCoordinator.start()
        return true
    }
}

extension AppDelegate {
    func initStyle() {
        let navBarApparence = UINavigationBar.appearance()
        navBarApparence.barStyle = .Black
        navBarApparence.tintColor = UIColor.whiteColor()
        navBarApparence.shadowImage = UIImage()
        navBarApparence.translucent = false
        
        let tabBarApparence = UITabBar.appearance()
        tabBarApparence.barStyle = .Black
        navBarApparence.tintColor = UIColor.whiteColor()
        navBarApparence.shadowImage = UIImage()
    }
}

