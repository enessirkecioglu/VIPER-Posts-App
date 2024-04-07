//
//  PostDetailPresenter.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//

import Foundation

protocol PostDetailPresenter: BasePresenter {
    var userName: String? { get }
    var title: String? { get }
    var body: String? { get }
    func viewWillAppear()
}

final class PostDetailPresenterImpl: PostDetailPresenter, PostDetailInteractorOutput {
    weak var view: PostDetailView!
    var interactor: PostDetailInteractorInput!
    var router: PostDetailWireframe!
    
    var postId: Int?
    
    var userName: String? { didSet {
        DispatchQueue.main.async {
            self.view.setUserName()
        }
    }}
    var title: String? { didSet {
        DispatchQueue.main.async {
            self.view.setTitle()
        }
    }}
    var body: String? { didSet {
        DispatchQueue.main.async {
            self.view.setBody()
        }
    }}
    
    func viewWillAppear() {
        interactor.getPostDetails(id: postId ?? 0)
    }
    
    func didReceivePostDetails(postDetails: PostListResponse) {
        userName = dummyUserNames[postDetails.userId ?? 0 % dummyUserNames.count]
        title = postDetails.title
        body = postDetails.body
    }
    
    func didReceiveAnError(error: RequestError) {
        print(error.localizedDescription)
    }
}
