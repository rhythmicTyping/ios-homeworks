//
//  InfoViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 13.03.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(alertButton)
        setupConstraints()
        alertButton.addTarget(self, action: #selector(showAllert), for: .touchUpInside)
    }
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alert Button", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 9
        button.translatesAutoresizingMaskIntoConstraints = false //  Обязательное свойство для верстки кодом (false)
        return button
    }()
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
extension InfoViewController {
    @objc func showAllert() {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("some message")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
