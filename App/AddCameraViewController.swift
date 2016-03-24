//
//  AddCameraViewController.swift
//  App
//
//  Created by Remi Robert on 24/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import AVFoundation
import CameraEngine

class AddCameraViewController: UIViewController, UIViewControllerCoordinable {

    private let disposeBag = DisposeBag()
    private var layerPreview: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        CameraManager.observableCode().subscribeNext { code in
            if let code = code {
                print("code : \(code)")
            }
        }.addDisposableTo(self.disposeBag)
    }
    
    func start() {
        self.layerPreview = CameraManager.sharedInstance.previewLayer
        self.layerPreview.frame = self.view.bounds
        self.view.layer.insertSublayer(self.layerPreview, atIndex: 0)
        self.view.layer.masksToBounds = true
    }
}
