//
//  File.swift
//  Navigation
//
//  Created by Evgeny Savin on 17.07.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    // MARK: Subviews
    
    private lazy var authorTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some text"
        
        return label
    }()
    
    private lazy var imageUIImage: UIImageView = {
        let image = UIImage(named: "postImage")
        let cellImage = UIImageView(image: image)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        return cellImage
    }()
    
    private lazy var desctiprionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "description"
        
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1231"
        
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "11231312"
        
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    //MARK: Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier)
        
        tuneView()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private
    
    private func tuneView() {
        contentView.backgroundColor = .white
        accessoryType = .none
    }
    
    private func addSubviews() {
        contentView.addSubview(authorTextLabel)
        contentView.addSubview(imageUIImage)
        contentView.addSubview(desctiprionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageUIImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageUIImage.widthAnchor.constraint(equalToConstant: screenWidth),
            imageUIImage.heightAnchor.constraint(equalToConstant: screenWidth),
            
            authorTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
            authorTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            authorTextLabel.bottomAnchor.constraint(equalTo: imageUIImage.topAnchor, constant: -16.0),
            
            desctiprionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            desctiprionLabel.topAnchor.constraint(equalTo: imageUIImage.bottomAnchor, constant: 16.0),
            
            likesLabel.topAnchor.constraint(equalTo: desctiprionLabel.bottomAnchor, constant: 16.0),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            
            viewsLabel.topAnchor.constraint(equalTo: desctiprionLabel.bottomAnchor, constant: 16.0),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            
        ])
    }
    
    // MARK: Public
    
    func update(_ model: Post) {
        authorTextLabel.text = model.author
        desctiprionLabel.text = model.description
    }
}

