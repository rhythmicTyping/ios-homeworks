//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        setupLayout()
    }
    
    let profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    private func setupLayout() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0.0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0.0),
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 0.0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
