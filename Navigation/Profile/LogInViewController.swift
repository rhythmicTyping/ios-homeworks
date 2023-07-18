//
//  LogInViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 21.05.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: Properties
    
    private var isDiffValid = true
    private lazy var insets = view.safeAreaInsets
    
    // MARK: Subviews
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(emptyView)
        stackView.addArrangedSubview(passwordTextField)
        
        return stackView
    }()
    
    private lazy var emptyView: UIView = {
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.backgroundColor = .lightGray
        return emptyView
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints    = false
        scrollView.showsVerticalScrollIndicator                 = false
        scrollView.showsHorizontalScrollIndicator               = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints   = false
        contentView.backgroundColor                             = .white
        
        return contentView
    }()
    
    private lazy var logoUIImageView: UIImageView = {
        let image   = UIImage(named: "AppLogo")
        let appLogo = UIImageView(image: image)
        
        appLogo.translatesAutoresizingMaskIntoConstraints   = false
        
        return appLogo
    }()
    
    private lazy var loginTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor          = .systemGray6
        field.layer.borderWidth = 0
        field.keyboardType             = UIKeyboardType.default
        field.returnKeyType            = UIReturnKeyType.done
        field.clearButtonMode          = UITextField.ViewMode.whileEditing
        field.textAlignment            = .center
        field.placeholder              = "Email or phone"
        field.font                     = UIFont.systemFont(ofSize: 16.0)
        field.textColor                = UIColor.black
        
        field.delegate                 = self
        return field
    }()
    
    private lazy var passwordTextField: UITextField = {
        let field = UITextField()
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType   = .none
        field.backgroundColor          = .systemGray6
        field.layer.borderWidth = 0
        field.keyboardType             = UIKeyboardType.default
        field.returnKeyType            = UIReturnKeyType.done
        field.clearButtonMode          = UITextField.ViewMode.whileEditing
        field.textAlignment            = .center
        field.placeholder              = "Password"
        field.font                     = UIFont.systemFont(ofSize: 16.0)
        field.textColor                = UIColor.black
        field.isSecureTextEntry        = true
        
        field.delegate                 = self
        return field
    }()
    
    private lazy var logInButton: ButtonWithChangingAlpha = {
        let button = ButtonWithChangingAlpha(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.tintColor            = .white
        button.backgroundColor      = UIColor(named: "background")
        button.layer.cornerRadius   = 10
        button.layer.masksToBounds  = true
        button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    
    // MARK: Actions
    
    @objc func buttonDidPressed() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc private func willShowKeyboard(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let sumOfInsets = insets.top + insets.bottom
            let frameButton = self.logInButton.frame.maxY
            let frameKeyboard = keyboardSize.minY
            let diff = frameButton - frameKeyboard
            if diff > 0 && isDiffValid {
                self.scrollView.frame.origin.y -= diff + sumOfInsets
                isDiffValid = false
            }
        }
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.frame.origin.y = insets.top
        isDiffValid = true
    }
    
    
    
    // MARK: Private
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoUIImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(logInButton)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120.0),
            logoUIImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoUIImageView.heightAnchor.constraint(equalToConstant: 100.0),
            logoUIImageView.widthAnchor.constraint(equalToConstant: 100.0),
            
            emptyView.heightAnchor.constraint(equalToConstant: 0.5),
            loginTextField.heightAnchor.constraint(equalToConstant: 50.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50.0),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            stackView.topAnchor.constraint(equalTo: logoUIImageView.bottomAnchor, constant: 120.0),
            stackView.heightAnchor.constraint(equalToConstant: 100.5),
            
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16.0),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            logInButton.heightAnchor.constraint(equalToConstant: 50.0),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

// MARK: Extension

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



