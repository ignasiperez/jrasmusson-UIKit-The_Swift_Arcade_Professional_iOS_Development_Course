//
//  LoginViewController.swift
//  Bankey
//
//  Created by Ignasi Perez-Valls on 26/8/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextfield.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
} // LoginViewController


extension LoginViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
        
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
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
//      errorMessageLabel.text = "Error failure"
//      errorMessageLabel.isHidden = false
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor
                .constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor,
                            multiplier: 3),
            titleLabel.centerXAnchor
                .constraint(equalTo: view.centerXAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor
                .constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor,
                            multiplier: 3),
            subtitleLabel.leadingAnchor
                .constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor
                .constraint(equalTo: loginView.trailingAnchor)
        ])
        
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
        
        // Error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor
                .constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor,
                            multiplier: 2),
            errorMessageLabel.leadingAnchor
                .constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor
                .constraint(equalTo: loginView.trailingAnchor)
        ])
    } // layout()
    
} // LoginViewController


// MARK: - Actions

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withmessage: "Username / password cannot be blank")
        }
    }
    
    private func configureView(withmessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
} // extension LoginViewController
