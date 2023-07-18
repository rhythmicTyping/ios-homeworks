//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 12.03.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    // MARK: Lifecycle
    
    let post: Post
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.post.description
        self.view.backgroundColor = .white
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToInfo))
        navigationItem.rightBarButtonItem = myButton
    }
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    @objc func goToInfo() {
        let infoViewController = InfoViewController()
        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .pageSheet
        present(infoViewController, animated: true)
    }
    
}
