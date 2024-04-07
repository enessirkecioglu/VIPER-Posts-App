//
//  PostListPresenter.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//

import Foundation

protocol PostListPresenter: BasePresenter {
    var postList: [PostListResponse] { get }
    func viewWillAppear()
    func didSelectRow(at indexPath: IndexPath)
}

final class PostListPresenterImpl: PostListPresenter, PostListInteractorOutput {
    func didSelectRow(at indexPath: IndexPath) {
        router.routeToPostDetail(id: postList[indexPath.row].id ?? 0)
    }
    
    weak var view: PostListView!
    var interactor: PostListInteractorInput!
    var router: PostListWireframe!
    
    var postList: [PostListResponse] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view.setPostList()
            }
        }
    }
    
    func viewWillAppear() {
        interactor.getPostList()
    }
    
    func didReceivePostList(list: [PostListResponse]) {
        postList = list
    }
    
    func didReceiveAnError(error: RequestError) {
        print(error.localizedDescription)
        postList = []
    }
}
