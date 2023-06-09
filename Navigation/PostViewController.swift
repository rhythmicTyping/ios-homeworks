//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 12.03.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    let post: Post
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.post.title
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

@objc func goToInfo() {
        let infoViewController = InfoViewController()
    
    infoViewController.modalTransitionStyle = .coverVertical
    infoViewController.modalPresentationStyle = .pageSheet
    
    present(infoViewController, animated: true)
    }
    
}




//    @objc func buttonDidPressed() {
//        let post = Post(title: "New post")
//        let postViewController = PostViewController(post: post)
//        self.navigationController?.pushViewController(postViewController, animated: true)
//    }
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


