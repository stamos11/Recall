//
//  ViewController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 20/3/24.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    // MARK: -Components
    let userController = UserController()
    let logoView = UIImageView()
    let loginView = LoginView()
    let toggleButton = UIButton(type: .custom)
    let continueButton = UIButton(type: .custom)
    
    var isToggled = false {
        didSet {
            toggled()
        }
    }
  
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // Authentication
    @objc func continueButtonTapped() {
        guard let email = loginView.emailTextField.text else {return }
        guard let password = loginView.passwordTextField.text else {return}
        if !isToggled {
           
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error {
                    print(error.localizedDescription)
                } else {
                    if let result {
                        guard let username = self.loginView.usernameTextField.text else { return}
                        let user = User(username: username, email: email)
                        self.userController.saveUser(user: user, id: result.user.uid){ error in
                            if let error {
                                print(error.localizedDescription)
                            }
                        }
                        let mainVc = MainController()
                        self.navigationController?.pushViewController(mainVc, animated:  true)
                    }
                  
                }
            }

        } else {
            Auth.auth().signIn(withEmail: email, password: password) { sucess, error in
                if let error {
                    print(error.localizedDescription)
                }
                if let sucess {
                    let mainVc = MainController()
                    self.navigationController?.pushViewController(mainVc, animated:  true)
                    print("User has logged in")
                }
            }
        }
        
    }
    // Actions
    @objc func toggleIsTapped() {
        isToggled.toggle()
        
    }
    private func toggled() {
        if isToggled {
            loginView.usernameTextField.isHidden = true
            toggleButton.setTitle("Dont have an account?", for: .normal)
            continueButton.setTitle("Start", for: .normal)
        } else {
            loginView.usernameTextField.isHidden = false
            toggleButton.setTitle("Already have an account?", for: .normal)
            continueButton.setTitle("Sign up", for: .normal)
        }
        
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
        toggleButton.addTarget(self, action: #selector(toggleIsTapped), for: .touchUpInside)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.configuration = .filled()
        continueButton.setTitle("Sign up", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "Avenir", size: 20) ?? .systemFont(ofSize: 20)
        continueButton.tintColor = .green
        continueButton.configuration?.cornerStyle = .capsule
        continueButton.clipsToBounds = true
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
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

