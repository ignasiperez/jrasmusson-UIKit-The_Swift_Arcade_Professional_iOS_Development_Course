//
//  LoginViewController.swift
//  Bankey
//
//  Created by Ignasi Perez-Valls on 26/8/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
} // LoginViewController


extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(
            self,
            action: #selector(signInTapped),
            for: .primaryActionTriggered
        )
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        
        // Login view
        NSLayoutConstraint.activate([
            loginView.centerYAnchor
                .constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor
                .constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                            multiplier: 1),
            view.trailingAnchor
                .constraint(equalToSystemSpacingAfter: loginView.trailingAnchor,
                            multiplier: 1),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor
                .constraint(equalToSystemSpacingBelow: loginView.bottomAnchor,
                            multiplier: 2),
            signInButton.leadingAnchor
                .constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor
                .constraint(equalTo: loginView.trailingAnchor)
        ])
    } // layout()
    
} // LoginViewController


// MARK: - Actions

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        
    }
}
