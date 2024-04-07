//
//  PostListInteractor.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 7.04.2024.
//

import Foundation

protocol PostListInteractorInput: BaseInteractorInput {
    func getPostList()
}

protocol PostListInteractorOutput: BaseInteractorOutput {
    func didReceivePostList(list: [PostListResponse])
    func didReceiveAnError(error: RequestError)
}


final class PostListInteractor: PostListInteractorInput {
    weak var output: PostListInteractorOutput!
    
    ///API istekleri
    ///Adjust istekleri
    ///Analytics istekleri vs.
    func getPostList() {
        NetworkManager.shared.fetchData(from: .getPosts, dataType: [PostListResponse].self) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response else {
                    self?.output.didReceiveAnError(error: .emptyData)
                    return
                }
                self?.output.didReceivePostList(list: response)
            case .failure(let error):
                self?.output.didReceiveAnError(error: error)
            }
        }
    }
}
