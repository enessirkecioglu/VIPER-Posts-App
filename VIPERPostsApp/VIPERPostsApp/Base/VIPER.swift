//
//  VIPER.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//


import UIKit

//MARK: View
protocol BaseView: AnyObject, UIViewController {
    
}

//MARK: Interactor
protocol BaseInteractorInput {
    
}

protocol BaseInteractorOutput: AnyObject {
    
}

//MARK: Presenter
protocol BasePresenter {
    
}

//MARK: Router
protocol BaseWireframe {
    static func generateModule(object: Any?) -> BaseView
}

