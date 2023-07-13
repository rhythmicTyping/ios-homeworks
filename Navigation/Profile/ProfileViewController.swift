//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    // MARK: Subviews
    
    private let profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    let newButton: UIButton = {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("New button", for: .normal)
        newButton.layer.cornerRadius = 4
        return newButton
    }()
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(newButton)
        setupLayout()
    }
    
// MARK: Actions
    
    private func setupLayout() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0.0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0.0),
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 0.0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0.0),
            newButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: 0.0),
            newButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
        ])
    }
}
