//
//  UITableView+Extension.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 6.04.2024.
//

import UIKit

extension UITableView {
    func register(_ cellType: UITableViewCell.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func register(_ cellTypes: [UITableViewCell.Type]) {
        for cellType in cellTypes {
            register(cellType)
        }
    }
}
