//
//  PersoContentViewController.swift
//  App
//
//  Created by Remi Robert on 23/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct PersoContentTransitions {
    var addNewBook: (Void -> Void)
}

class PersoContentViewController: UIViewController, UIViewControllerCoordinable {

    private lazy var addBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewBook")
        button.tintColor = UIColor.mainAppColor()
        return button
    }()
    
    var transitions: PersoContentTransitions?
    
    func addNewBook() {
        self.transitions?.addNewBook()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.addBarButton
        
        self.title = "My library"
        self.view.backgroundColor = UIColor.darkGrayColor()
    }
    
    func start() {
    }
}
