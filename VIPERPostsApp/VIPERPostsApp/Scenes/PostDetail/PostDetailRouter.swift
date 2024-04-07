//
//  PostDetailRouter.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//

import Foundation

protocol PostDetailWireframe: BaseWireframe {
    
}

final class PostDetailRouter: PostDetailWireframe {
    static func generateModule(object: Any?) -> BaseView {
        let presenter = PostDetailPresenterImpl()
        let interactor = PostDetailInteractor()
        let router = PostDetailRouter()
        
        let view = PostDetailViewController(presenter: presenter)
        presenter.postId = object as? Int
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        
        
        return view
    }
    
    
}
