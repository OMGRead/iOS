//
//  FeedViewController.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct FeedTransitions {
    
}

class FeedViewController: UIViewController, UIViewControllerCoordinable {

    typealias ResponseObject = Int

    var transitions: FeedTransitions?
    var completionHandler: (ResponseObject -> Void)?
    
    func start() {
        print("start stuff feed controller")
    }
}
