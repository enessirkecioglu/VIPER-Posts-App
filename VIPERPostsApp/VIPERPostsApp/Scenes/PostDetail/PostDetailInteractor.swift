//
//  PostDetailInteractor.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//

import Foundation

protocol PostDetailInteractorInput: BaseInteractorInput {
    func getPostDetails(id: Int)
}

protocol PostDetailInteractorOutput: BaseInteractorOutput {
    func didReceivePostDetails(postDetails: PostListResponse)
    func didReceiveAnError(error: RequestError)
}

final class PostDetailInteractor: PostDetailInteractorInput {
    weak var output: PostDetailInteractorOutput!
    
    func getPostDetails(id: Int) {
        NetworkManager.shared.fetchData(from: .getPostDetail(postId: id), dataType: PostListResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response else {
                    self?.output.didReceiveAnError(error: .emptyData)
                    return
                }
                self?.output.didReceivePostDetails(postDetails: response)
            case .failure(let error):
                self?.output.didReceiveAnError(error: error)
            }
        }
    }
}
