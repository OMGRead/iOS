
//
//  AppCoordinator.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import RxSwift

protocol UIViewControllerCoordinable {
    func start()
}

class AppCoordinator: NSObject {

    private let rootController: UIViewController
    
    required init(rootController: UINavigationController) {
        self.rootController = rootController
        super.init()
    }
    
    private func isLogged() -> Bool {
        //check if user already logged
        return false
    }
    
    private func instanceLoginController() {
        let vc = LoginViewController()
        vc.transitions = LoginTransitions(
            didLogin: {
                self.instanceFeedController()
            }
        )
    }
    
    private func instanceFeedController() {
        
    }
    
    func start() {
        self.isLogged() ? self.instanceFeedController() : self.instanceLoginController()
    }
}
