//
//  PostListRouter.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//

import Foundation

protocol PostListWireframe: BaseWireframe {
    func routeToPostDetail(id: Int)
}

final class PostListRouter: PostListWireframe {
    static func generateModule(object: Any?) -> BaseView {
        let interactor = PostListInteractor()
        let presenter = PostListPresenterImpl()
        let router = PostListRouter()
        
        let view = PostListViewController(presenter: presenter)
        view.title = "Post List"
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        
        return view
    }
    
    func routeToPostDetail(id: Int) {
        let postDetail = AppScene.postDetail.router.generateModule(object: id)
        RouterManager.shared.rootNavigationController?.pushViewController(postDetail, animated: true)
    }
}
