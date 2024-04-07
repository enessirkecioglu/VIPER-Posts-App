//
//  PostDetailViewController.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 6.04.2024.
//

import UIKit

protocol PostDetailView: BaseView {
    func setUserName()
    func setTitle()
    func setBody()
}

final class PostDetailViewController: UIViewController, PostDetailView {
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    var presenter: PostDetailPresenter
    
    init(presenter: PostDetailPresenter) {
        self.presenter = presenter
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
        presenter.viewWillAppear()
    }
    
    func setUserName() {
        userNameLabel.text = presenter.userName
    }
    
    func setTitle() {
        titleLabel.text = presenter.title
    }
    
    func setBody() {
        bodyLabel.text = presenter.body
    }
    
}
