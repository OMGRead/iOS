//
//  CameraManager.swift
//  App
//
//  Created by Remi Robert on 24/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import RxSwift
import AVFoundation
import CameraEngine

class CameraManager {
    private let cameraEngine = CameraEngine()
    static let sharedInstance = CameraManager()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer! = self.cameraEngine.previewLayer
    
    class func observableCode() -> Observable<String?> {
        self.sharedInstance.cameraEngine.metadataDetection = CameraEngineCaptureOutputDetection.BareCode
        return Observable.create { observer in
            self.sharedInstance.cameraEngine.blockCompletionCodeDetection = { codeObject in
                if let valueCode = codeObject.stringValue {
                    observer.onNext(valueCode)
                }
                else {
                    observer.onNext(nil)
                }
            }
            return AnonymousDisposable {
                self.sharedInstance.cameraEngine.metadataDetection = CameraEngineCaptureOutputDetection.None
            }
        }
    }
    
    class func start() {
        self.sharedInstance.cameraEngine.startSession()
    }
}
