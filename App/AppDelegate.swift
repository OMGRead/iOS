//
//  AppDelegate.swift
//  App
//
//  Created by Remi Robert on 21/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var appCoordinator: AppCoordinator = AppCoordinator(window: self.window!)
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.initStyle()
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "63966E18-33C1-431B-A50E-4F68652C2A4D"
            $0.clientKey = "5B45972F-36B7-4FBB-85A0-B2EA733586CD"
            $0.server = "http://192.168.0.103:8002/parse"
        }
        Parse.initializeWithConfiguration(configuration)
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        self.appCoordinator.start()
        CameraManager.start()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
}

extension AppDelegate {
    func initStyle() {
        self.window?.tintColor = UIColor.mainAppColor()
        
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

