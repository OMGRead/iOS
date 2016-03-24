//
//  MainTabBarViewController.swift
//  App
//
//  Created by Remi Robert on 23/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UIViewControllerCoordinable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.items?.first?.image = UIImage(named: "bookIcon")?.imageWithRenderingMode(.Automatic)
        self.tabBar.items?.first?.selectedImage = UIImage(named: "bookIcon")?.imageWithRenderingMode(.Automatic)
//        self.tabBar.items?.last?.image = UIImage(named: "friendIcon")?.imageWithRenderingMode(.Automatic)
//        self.tabBar.items?.last?.selectedImage = UIImage(named: "friendIcon")?.imageWithRenderingMode(.Automatic)
    }
    
    func start() {
        
    }
}
