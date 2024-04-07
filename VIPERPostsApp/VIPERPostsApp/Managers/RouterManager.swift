//
//  RouterManager.swift
//  EffiPlanner
//
//  Created by Enes Sirkecioğlu on 29.07.2023.
//

import UIKit

struct RouterManager {
    static let shared = RouterManager()
    
    var rootNavigationController: UINavigationController? {
        return UIApplication.shared.rootViewController as? UINavigationController
    }
    
    private init() { }
    
    func startApp(from scene: AppScene) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.sceneDelegate?.window else { return }
            let view = scene.router.generateModule(object: nil)
            let navigationController = UINavigationController(rootViewController: view)
            
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.3
            
            UIView.transition(with: window, duration: duration, options: options, animations: {
                UIApplication.shared.rootViewController = navigationController
            }, completion: nil)
        }
    }
    
    private func setupHomeNavigationController(_ navigationController: UINavigationController) {
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
    }
}
