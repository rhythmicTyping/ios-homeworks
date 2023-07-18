////
////  PostTableViewCell.swift
////  Navigation
////
////  Created by Evgeny Savin on 27.05.2023.
////
//
//import UIKit
//
//class PostTableViewCell: UITableViewCell {
//
//    // MARK: Subvievs
//
//    private lazy var authorTitleLabel: UILabel = {
//        let label                                       = UILabel()
//        label.text                                      = postArray.randomElement()?.author
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    private lazy var descriptionLabel: UILabel = {
//        let label                                       = UILabel()
//        label.text                                      = postArray.randomElement()?.description
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    private lazy var postImage: UIImageView = {
//        let image                                           = UIImage(named: (postArray.randomElement()?.image)!)
//        let postImage                                       = UIImageView(image: image)
//        postImage.translatesAutoresizingMaskIntoConstraints = false
//
//        return postImage
//    }()
//
//    private lazy var likesCountLabel: UILabel = {
//        let label                                       = UILabel()
//        label.text                                      = String(postArray.randomElement()?.likes ?? 0)
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    private lazy var viewsCountLbel: UILabel = {
//        let label                                       = UILabel()
//        label.text                                      = String(postArray.randomElement()?.views ?? 0)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}
