//
//  PostDetailViewController.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 6.04.2024.
//

import UIKit

final class PostDetailViewController: UIViewController {
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    var postId: Int?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = ""
        titleLabel.text = ""
        bodyLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let postId {
            NetworkManager.shared.fetchData(from: .getPostDetail(postId: postId), dataType: PostListResponse.self) { [weak self] result in
                switch result {
                case .success(let response):
                    guard let response else { return }
                    DispatchQueue.main.async {
                        self?.userNameLabel.text = dummyUserNames[response.userId ?? 0 % dummyUserNames.count]
                        self?.titleLabel.text = response.title
                        self?.bodyLabel.text = response.body
                    }
                case .failure(_):
                    break
                }
            }
        }
    }

}
