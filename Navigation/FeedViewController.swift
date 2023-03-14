//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 12.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
   private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Post", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 9
        button.translatesAutoresizingMaskIntoConstraints = false //  Обязательное свойство для верстки кодом (false)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        setupConstraints()
        button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)

    }
    
    @objc func buttonDidPressed() {
        let post = Post(title: "New post")
        let postViewController = PostViewController(post: post)
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
