//
//  PostCell.swift
//  VIPERPostsApp
//
//  Created by Enes Sirkecioğlu on 5.04.2024.
//

import UIKit

struct PostCellUI {
    var userName: String
    var titleText: String
    var bodyText: String
}

final class PostCell: UITableViewCell {
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: PostCellUI) {
        userNameLabel.text = model.userName
        titleLabel.text = model.titleText
        bodyLabel.text = model.bodyText
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = ""
        titleLabel.text = ""
        bodyLabel.text = ""
    }
}
