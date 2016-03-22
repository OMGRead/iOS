
//
//  AppCoordinator.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

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
    
    func start() {
    }
    
}
