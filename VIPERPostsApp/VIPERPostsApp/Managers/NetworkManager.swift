//
//  NetworkManager.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 6.04.2024.
//

import Foundation

let dummyUserNames: [String] = ["Benjamin Wyss", "Damian K. Whitaker", "Tabitha C. Schuster", "Annette J. Strickland", "Helen D. Greenwood"]

enum Endpoints {
    case getPosts
    case getPostDetail(postId: Int)
    
    var method: String {
        switch self {
        case .getPosts, .getPostDetail:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .getPostDetail(let postId):
            return "/posts/\(postId)"
        }
    }
    
    var urlParameters: String? {
        return nil
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl = "https://jsonplaceholder.typicode.com"
    
    private init() { }
    
    func fetchData<T: Decodable>(from endpoint: Endpoints, dataType: T.Type, completion: @escaping (Result<T?, RequestError>) -> Void) {
        let urlString = baseUrl + endpoint.path
        guard let url = URL(string: urlString) else {
            print("The given url was not valid")
            completion(.failure(.urlNotValid))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                print(error.localizedDescription)
                completion(.failure(.taskError))
                return
            }
            
            guard let data else {
                completion(.failure(.emptyData))
                return
            }
            
            let decodedData = try? JSONDecoder().decode(dataType, from: data)
            completion(.success(decodedData))
            
        }.resume()
    }
}

struct PostListResponse: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

enum RequestError: Error {
    case urlNotValid
    case emptyData
    case taskError
}
