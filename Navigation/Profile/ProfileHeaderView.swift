//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        let image = UIImage(named: "Billy")
        let profilePhoto = UIImageView(image: image)
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.backgroundColor = .black
        profilePhoto.layer.cornerRadius = 50
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        profilePhoto.clipsToBounds = true
        return profilePhoto
    }()
    
    let fullNameLabel: UILabel = {
        let profileName = UILabel()
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.text = "Billy Herrington"
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        return profileName
    }()
    
    var statusLabel: UILabel = {
        var profileStatus = UILabel()
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        profileStatus.text = "Waiting for the ♂ gym ♂..."
        profileStatus.textColor = UIColor.gray
        return profileStatus
    }()
    
    let statusTextField: UITextField = {
        let variableStatus = UITextField()
        variableStatus.translatesAutoresizingMaskIntoConstraints = false
        variableStatus.backgroundColor = .white
        variableStatus.layer.borderWidth = 1
        variableStatus.layer.borderColor = UIColor.black.cgColor
        variableStatus.layer.cornerRadius = 12
        variableStatus.textAlignment = .center
        variableStatus.attributedPlaceholder = NSAttributedString(string: "Tell me about ♂ gym ♂ ", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 15)
        ])
        
        return variableStatus
    }()
    
    let setStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.clipsToBounds = false
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.shadowRadius = 4.0
        showStatusButton.layer.masksToBounds = false
        return showStatusButton
    }()
    
    let newButton: UIButton = {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("New button", for: .normal)
        newButton.layer.cornerRadius = 4
        return newButton
    }()
    
    private var statusText: String = ""
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text!)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let _ = textField.text {
            statusText = textField.text ?? "Enter your status"
        }
    }
    
    func setupLayout() {
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(newButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100.0),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27.0),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20.0),
            
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -40.0),
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20.0),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 25.0),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant:  16.0),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10.0),
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20.0),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            statusTextField.heightAnchor.constraint(equalToConstant: 25.0),
            
            newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 333)
        ])
    }
    
}
