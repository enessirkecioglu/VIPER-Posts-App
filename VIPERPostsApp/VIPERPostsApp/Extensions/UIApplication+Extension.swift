//
//  UIApplication+Extension.swift
//  EffiPlanner
//
//  Created by Enes Sirkecioğlu on 29.07.2023.
//

import UIKit

extension UIApplication {
    var sceneDelegate: SceneDelegate? {
        return UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    }
    
    var rootViewController: UIViewController? {
        get {
            return sceneDelegate?.window?.rootViewController
        } set {
            sceneDelegate?.window?.rootViewController = newValue
        }
    }
}
