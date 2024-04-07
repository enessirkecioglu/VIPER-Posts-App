//
//  PostListViewController.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 5.04.2024.
//

import UIKit

let dummyUserNames: [String] = ["Benjamin Wyss", "Damian K. Whitaker", "Tabitha C. Schuster", "Annette J. Strickland", "Helen D. Greenwood"]

final class PostListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var postList: [PostListResponse] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NetworkManager.shared.fetchData(from: .getPosts, dataType: [PostListResponse].self) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response else { return }
                DispatchQueue.main.async {
                    self?.postList = response
                }
            case .failure(_):
                break
            }
        }
    }

}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        let model = postList[indexPath.row]
        let userName = dummyUserNames[model.userId ?? 0 % dummyUserNames.count]
        let uiModel = PostCellUI(userName: userName, titleText: model.title ?? "", bodyText: model.body ?? "")
        cell.configure(with: uiModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailVC = PostDetailViewController()
        postDetailVC.postId = postList[indexPath.row].id
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
    
}
