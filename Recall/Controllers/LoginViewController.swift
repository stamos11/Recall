//
//  ViewController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 20/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: -Components
    
    let logoView = UIImageView()
    let loginView = LoginView()
    let toggleButton = UIButton(type: .custom)
    let continueButton = UIButton(type: .custom)
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension LoginViewController {
    
    private func style() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.image = UIImage(imageLiteralResourceName: "fasistas")
        logoView.contentMode = .scaleAspectFit
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.backgroundColor = .clear
        
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.configuration = .plain()
        toggleButton.titleLabel?.font = UIFont(name: "Avenir", size: 10) ?? .systemFont(ofSize: 10)
        toggleButton.setTitle("Already have an account?", for: .normal)
        toggleButton.tintColor = .systemRed
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.configuration = .filled()
        continueButton.setTitle("Sign up", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "Avenir", size: 20) ?? .systemFont(ofSize: 20)
        continueButton.tintColor = .green
        continueButton.configuration?.cornerStyle = .capsule
        continueButton.clipsToBounds = true
        
    }
    
    private func layout() {
        view.addSubview(logoView)
        view.addSubview(loginView)
        view.addSubview(toggleButton)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: logoView.trailingAnchor, multiplier: 2),
            logoView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: loginView.bottomAnchor),
            toggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: continueButton.trailingAnchor, multiplier: 2)
        ])
    }
}

