//
//  LoginViewController.swift
//  Bankey
//
//  Created by Ignasi Perez-Valls on 26/8/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

} // LoginViewController


extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor
                .constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor
                .constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                            multiplier: 1),
            view.trailingAnchor
                .constraint(equalToSystemSpacingAfter: loginView.trailingAnchor,
                            multiplier: 1)
        ])
    } // layout()
    
} // LoginViewController
