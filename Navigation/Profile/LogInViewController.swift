//
//  LogInViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 21.05.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: Subviews
    
    private lazy var appLogoUIImageView: UIImageView = {
        let image = UIImage(named: "AppLogo")
        let appLogo = UIImageView(image: image)
        appLogo.translatesAutoresizingMaskIntoConstraints = false
        
        return appLogo
    }()
    
    private lazy var loginTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor       = .systemGray6
        field.layer.cornerRadius    = 10
        field.layer.maskedCorners   = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        field.layer.borderWidth     = 0.5
        field.layer.borderColor     = UIColor.lightGray.cgColor
        field.placeholder           = "Email or phone"
        field.font                  = UIFont.systemFont(ofSize: 16.0)
        field.textColor             = UIColor.black
    
        return field
    }()
    
    private lazy var passwordTextField: UITextField = {
        let field = UITextField()
        
        field.autocapitalizationType = .none
        field.backgroundColor        = .systemGray6
        field.layer.cornerRadius     = 10
        field.layer.maskedCorners    = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        field.layer.borderWidth      = 0.5
        field.layer.borderColor      = UIColor.lightGray.cgColor
        field.placeholder            = "Password"
        field.font                   = UIFont.systemFont(ofSize: 16.0)
        field.textColor              = UIColor.black
        field.isSecureTextEntry      = true
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    private lazy var logInButton: ButtonWithChangingAlpha = {
        let button = ButtonWithChangingAlpha(type: .system)
        button.setTitle("Log in", for: .normal)
        button.tintColor            = .white
        button.backgroundColor      = UIColor(named: "background")
        button.layer.cornerRadius   = 10
        button.layer.masksToBounds  = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupContstraints()
    }
    
    // MARK: Actions
    
    @objc func buttonDidPressed() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.addSubview(appLogoUIImageView)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
    }
    
    private func setupContstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            appLogoUIImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 120.0),
            appLogoUIImageView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            appLogoUIImageView.widthAnchor.constraint(equalToConstant: 100.0),
            appLogoUIImageView.heightAnchor.constraint(equalToConstant: 100.0),
            
            loginTextField.topAnchor.constraint(equalTo: appLogoUIImageView.bottomAnchor, constant: 120.0),
            loginTextField.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            loginTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0.0),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor, constant: 0.0),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor, constant: 0.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16.0),
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50.0)
            
        ])
    }
}
