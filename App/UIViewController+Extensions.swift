//
//  UIViewController+Extensions.swift
//  App
//
//  Created by Remi Robert on 22/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

enum StoryBoards: String {
    case Main = "Main"
    case Login = "Login"
    case Detail = "Detail"
    
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

extension NSObject {
    static var nameOfClass: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
}

extension UIViewController {
    class func instanceController(storyboard: StoryBoards) -> UIViewController? {
        print("storybiard : \(storyboard.rawValue)")
        print("id : \(self.nameOfClass)")
        return storyboard.storyboard().instantiateViewControllerWithIdentifier(self.nameOfClass)
        
//        return UIStoryboard(name: "Login", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController")
//        return storyboard.storyboard().instantiateViewControllerWithIdentifier("LoginViewController")
    }
}
