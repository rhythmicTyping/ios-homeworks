//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 12.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: Subviews
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        return stackView
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
    
    private lazy var buttonInStackView1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("More details", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonInStackView2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Much more details", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    // MARK: Actions
    
    @objc private func buttonPressed() {
        let post = Post(title: "This post title")
        let postViewController = PostViewController(post: post)
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonInStackView1)
        stackView.addArrangedSubview(buttonInStackView2)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0)
        ])
    }
}
