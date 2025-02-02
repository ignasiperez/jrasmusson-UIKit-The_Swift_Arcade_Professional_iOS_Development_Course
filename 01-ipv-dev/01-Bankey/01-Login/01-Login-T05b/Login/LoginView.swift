//
//  LoginView.swift
//  Bankey
//
//  Created by Ignasi Perez-Valls on 27/8/23.
//

import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextfield = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  override var intrinsicContentSize: CGSize {
//      return CGSize(width: 200, height: 200)
//  }

} // LoginView


extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.delegate = self
        
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder = "Password"
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout() {
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextfield)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor
                .constraint(equalToSystemSpacingBelow: topAnchor,
                            multiplier: 1),
            stackView.leadingAnchor
                .constraint(equalToSystemSpacingAfter: leadingAnchor,
                            multiplier: 1),
            trailingAnchor
                .constraint(equalToSystemSpacingAfter: stackView.trailingAnchor,
                            multiplier: 1),
            bottomAnchor
                .constraint(equalToSystemSpacingBelow: stackView.bottomAnchor,
                            multiplier: 1)
            ])
        
        dividerView.heightAnchor
            .constraint(equalToConstant: 1)
            .isActive = true
    }
    
} // extension LoginView


// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
} // extension LoginView: UITextFieldDelegate
