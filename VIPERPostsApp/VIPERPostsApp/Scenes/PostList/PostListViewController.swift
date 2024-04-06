//
//  PostListViewController.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 5.04.2024.
//

import UIKit

final class PostListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PostCell.self)
    }

}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath)
    }
    
}
