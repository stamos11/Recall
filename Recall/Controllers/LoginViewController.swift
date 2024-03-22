//
//  ViewController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 20/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: -Components
    
    let loginView = LoginView()
    let toggleButton = UIButton(type: .custom)
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.backgroundColor = .secondarySystemBackground
        
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.configuration = .plain()
        toggleButton.titleLabel?.font = UIFont(name: "Avenir", size: 10) ?? .systemFont(ofSize: 10)
        toggleButton.setTitle("Already have an account?", for: .normal)
        toggleButton.tintColor = .systemRed
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(toggleButton)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: loginView.bottomAnchor),
            toggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

