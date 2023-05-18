//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    let profilePhoto: UIImageView  = {
        let image = UIImage(named: "ProfilePhoto")
        let profilePhoto = UIImageView(image: image)
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.backgroundColor = .black
        profilePhoto.layer.cornerRadius = 50
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        return profilePhoto
    }()
    let profileName: UILabel = {
        let profileName = UILabel()
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.text = "Billy Herrington"
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        return profileName
    }()
    let profileStatus: UILabel = {
        let profileStatus = UILabel()
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        profileStatus.text = "Waiting for the ♂ gym ♂..."
        profileStatus.textColor = UIColor.gray
        return profileStatus
    }()
    let showStatusButton: ButtonWithShadow = {
        let showStatusButton = ButtonWithShadow()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.clipsToBounds = false
        return showStatusButton
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        print(profileStatus.text!)
        }
    
    func setupLayout() {
        addSubview(profilePhoto)
        addSubview(profileName)
        addSubview(profileStatus)
        addSubview(showStatusButton)
        NSLayoutConstraint.activate([
            profilePhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            profilePhoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            profilePhoto.widthAnchor.constraint(equalToConstant: 100),
            profilePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            profileName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            profileName.leftAnchor.constraint(equalTo: profilePhoto.rightAnchor, constant: 20),
            
            profileStatus.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            profileStatus.leftAnchor.constraint(equalTo: profilePhoto.rightAnchor, constant: 20),
            
            showStatusButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 16),
            showStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant:  16),
            showStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

