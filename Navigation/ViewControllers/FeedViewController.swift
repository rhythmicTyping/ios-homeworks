//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 12.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: Subviews
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go to post", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 9
        return button
    }()
    
    private lazy var firstViewInStack: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var secondViewInStack: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        view.backgroundColor = .white
        view.addSubview(postButton)
        view.addSubview(stackView)
        setupViews()
    }
    
    // MARK: Actions
    
    @objc private func buttonPressed() {
        let post = Post(title: "This post title")
        let postViewController = PostViewController(post: post)
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func setupViews() {
        let button1 = UIButton(type: .system)
        button1.setTitle("More detailed", for: .normal)
        button1.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("More detailed", for: .normal)
        button2.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(button2)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0)
        ])
    }
}
