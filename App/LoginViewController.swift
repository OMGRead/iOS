//
//  LoginViewController.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import RxSwift
import Parse
import ParseFacebookUtilsV4

struct LoginTransitions {
    var didLogin: (Void -> Void)
}

class LoginViewController: UIViewController, UIViewControllerCoordinable {

    var transitions: LoginTransitions?
    
    @IBAction func login(sender: AnyObject) {
        PFFacebookUtils.logInInBackgroundWithPublishPermissions(nil) { (user: PFUser?, error: NSError?) -> Void in
            if let _ = user {
                self.transitions?.didLogin()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    func start() {
        print("start doing stuff here login controller")
    }
}
