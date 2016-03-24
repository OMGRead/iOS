//
//  AppColors.swift
//  App
//
//  Created by Remi Robert on 23/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import DynamicColor

extension UIColor {
    
    static func mainAppColor() -> UIColor {
        return UIColor(red:0.49, green:0.85, blue:0.50, alpha:1.00)
    }
    
    static func darkerAppColor() -> UIColor {
        return UIColor.mainAppColor().darkerColor()
    }
    
    static func lighterAppColor() -> UIColor {
        return UIColor.mainAppColor().lighterColor()
    }
}