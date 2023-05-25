//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: Subviews
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: "Billy")
        let profilePhoto = UIImageView(image: image)
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.backgroundColor    = .black
        profilePhoto.layer.cornerRadius = 50
        profilePhoto.layer.borderWidth  = 3
        profilePhoto.layer.borderColor  = UIColor.white.cgColor
        profilePhoto.clipsToBounds      = true
        return profilePhoto
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let profileName     = UILabel()
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.text    = "Billy Herrington"
        profileName.font    = UIFont.boldSystemFont(ofSize: 18)
        return profileName
    }()
    
    private lazy var statusLabel: UILabel = {
        var profileStatus   = UILabel()
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        profileStatus.text  = "Waiting for the ♂ gym ♂..."
        profileStatus.textColor = UIColor.gray
        return profileStatus
    }()
    
    private lazy var statusTextField: UITextField = {
        let variableStatus = UITextField()
        variableStatus.translatesAutoresizingMaskIntoConstraints = false
        variableStatus.backgroundColor      = .white
        variableStatus.layer.borderWidth    = 1
        variableStatus.layer.borderColor    = UIColor.black.cgColor
        variableStatus.layer.cornerRadius   = 12
        variableStatus.textAlignment        = .center
        variableStatus.placeholder          = "Tell me about ♂ gym ♂"
        variableStatus.font                 = UIFont.systemFont(ofSize: 15)
        variableStatus.textColor            = UIColor.black
        variableStatus.keyboardType         = UIKeyboardType.default
        variableStatus.returnKeyType        = UIReturnKeyType.done
        variableStatus.clearButtonMode      = UITextField.ViewMode.whileEditing
        
        variableStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return variableStatus
    }()
    
    private lazy var setStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.backgroundColor        = .systemBlue
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.clipsToBounds          = false
        
        showStatusButton.layer.cornerRadius     = 4
        showStatusButton.layer.shadowColor      = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset     = CGSize(width: 4.0, height: 4.0)
        showStatusButton.layer.shadowOpacity    = 0.7
        showStatusButton.layer.shadowRadius     = 4.0
        showStatusButton.layer.masksToBounds    = false
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return showStatusButton
    }()
    
    private var statusText: String = ""
    
    // MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
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
            statusTextField.heightAnchor.constraint(equalToConstant: 25.0)
            
        ])
    }
    
}
