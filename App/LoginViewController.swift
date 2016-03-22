//
//  LoginViewController.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import RxSwift

struct LoginTransitions {
    var didLogin: (Void -> Void)
}

class LoginViewController: UIViewController, UIViewControllerCoordinable {

    var transitions: LoginTransitions?
    
    func start() {
        print("start doing stuff here login controller")
    }
}
