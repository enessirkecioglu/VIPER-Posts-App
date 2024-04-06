//
//  SplashViewController.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 5.04.2024.
//

import UIKit

final class SplashViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        routeToPostList()
    }
}

//Private Functions
private extension SplashViewController {
    func routeToPostList() {
        guard let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window else { return }
        
        
        let postListVC = PostListViewController()
        postListVC.title = "Post List"
        let navigationController = UINavigationController(rootViewController: postListVC)
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navigationController
        }, completion: nil)
    }
}
