//
//  AddCameraViewController.swift
//  App
//
//  Created by Remi Robert on 24/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import Parse
import SnapKit
import RxSwift
import AVFoundation
import CameraEngine

class AddCameraViewController: UIViewController, UIViewControllerCoordinable {

    private let disposeBag = DisposeBag()
    private var layerPreview: AVCaptureVideoPreviewLayer!
    
    lazy var borderTop: UIView! = self.initBorder()
    lazy var borderBottom: UIView! = self.initBorder()
    private var constraintTopHeigh: Constraint!
    private var constraintBottomHeight: Constraint!
    
    private func initBorder() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }
    
    override func viewDidAppear(animated: Bool) {
        self.constraintTopHeigh.updateOffset(0)
        self.constraintBottomHeight.updateOffset(0)
        
        UIView.animateWithDuration(0.75) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        CameraManager.observableCode().subscribeNext { code in
            if let code = code {
                print("code : \(code)")
                
                PFCloud.callFunctionInBackground("findISBN", withParameters: ["code": code], block: { (respnose: AnyObject?, error: NSError?) in
                    
                })
            }
        }.addDisposableTo(self.disposeBag)
        
        self.view.addSubview(self.borderTop)
        self.borderTop.snp_makeConstraints { (make) in
            make.width.equalTo(self.view)
            self.constraintTopHeigh = make.height.equalTo(CGRectGetHeight(UIScreen.mainScreen().bounds) / 2).constraint
            make.top.equalTo(self.view)
        }
        self.view.addSubview(self.borderBottom)
        self.borderBottom.snp_makeConstraints { (make) in
            make.width.equalTo(self.view)
            self.constraintBottomHeight = make.height.equalTo(CGRectGetHeight(UIScreen.mainScreen().bounds) / 2).constraint
            make.bottom.equalTo(self.view)
        }
    }
    
    func start() {
        self.layerPreview = CameraManager.sharedInstance.previewLayer
        self.layerPreview.frame = self.view.bounds
        self.view.layer.insertSublayer(self.layerPreview, atIndex: 0)
        self.view.layer.masksToBounds = true
    }
}
