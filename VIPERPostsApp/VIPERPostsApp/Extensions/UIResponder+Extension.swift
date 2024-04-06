//
//  UIResponder+Extension.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 6.04.2024.
//

import UIKit

extension UIResponder {
    static var identifier: String {
        return String(describing: self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle(for: Self.self))
    }
}
