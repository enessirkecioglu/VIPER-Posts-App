//
//  AppScene.swift
//  EffiPlanner
//
//  Created by Enes Sirkecioğlu on 20.08.2023.
//

import Foundation

enum AppScene {
    case postList
    case postDetail
}

extension AppScene {
    var router: BaseWireframe.Type {
        switch self {
        case .postList:
            return PostListRouter.self
        case .postDetail:
            return PostDetailRouter.self
        }
    }
}
