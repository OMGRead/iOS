
//
//  AppCoordinator.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import RxSwift
import Parse

protocol UIViewControllerCoordinable {
    func start()
}

struct AppCoordinator {

    private var window: UIWindow
    private var rootController: UIViewController! {
        didSet {
            self.window.rootViewController = self.rootController
        }
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    private func isLogged() -> Bool {
        if let _ = PFUser.currentUser() {
            return true
        }
        return false
    }
    
    private mutating func instanceAddCameraBookController() {
        if let vc = AddCameraViewController.instanceController(StoryBoards.Add) as? AddCameraViewController {
            self.rootController.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    private mutating func instanceLoginController() {
        if let vc = LoginViewController.instanceController(StoryBoards.Login) as? LoginViewController {
            vc.transitions = LoginTransitions(
                didLogin: {
                    self.instanceFeedController()
                }
            )
            self.rootController = UINavigationController(rootViewController: vc)
            vc.start()
        }
    }
    
    private mutating func instanceFeedController() {
        if let detailController = PersoContentViewController.instanceController(StoryBoards.Detail) as? PersoContentViewController {
            let vc = MainTabBarViewController()
            
            detailController.transitions = PersoContentTransitions(
                addNewBook: {
                    self.instanceAddCameraBookController()
                }
            )
            
            vc.setViewControllers([UINavigationController(rootViewController: detailController)], animated: true)
            self.rootController = vc
        }
    }
    
    mutating func start() {
        self.isLogged() ? self.instanceFeedController() : self.instanceLoginController()
    }
}
