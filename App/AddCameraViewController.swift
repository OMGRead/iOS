//
//  AddCameraViewController.swift
//  App
//
//  Created by Remi Robert on 24/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import CameraEngine

class AddCameraViewController: UIViewController, UIViewControllerCoordinable {

    private lazy var cameraEngine = CameraEngine()
    
    override func viewWillAppear(animated: Bool) {
        self.view.layer.addSublayer(self.cameraEngine.previewLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        self.cameraEngine.startSession()
    }
}
