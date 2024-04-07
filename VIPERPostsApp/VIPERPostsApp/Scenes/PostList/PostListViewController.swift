//
//  PostListViewController.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 5.04.2024.
//

import UIKit

protocol PostListView: BaseView {
    func setPostList()
}

final class PostListViewController: UIViewController, PostListView {
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: PostListPresenter
    
    init(presenter: PostListPresenter) {
        self.presenter = presenter
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
        presenter.viewWillAppear()
    }
    
    func setPostList() {
        tableView.reloadData()
    }
}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        let model = presenter.postList[indexPath.row]
        let userName = dummyUserNames[model.userId ?? 0 % dummyUserNames.count]
        let uiModel = PostCellUI(userName: userName, titleText: model.title ?? "", bodyText: model.body ?? "")
        cell.configure(with: uiModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
    
}
