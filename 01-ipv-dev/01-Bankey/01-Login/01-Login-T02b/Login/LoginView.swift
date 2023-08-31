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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }

} // LoginView


extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.delegate = self
    }
    
    func layout() {
        stackView.addArrangedSubview(userNameTextField)
        
//      addSubview(userNameTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
//          userNameTextField.topAnchor
//              .constraint(equalToSystemSpacingBelow: topAnchor,
//                            multiplier: 1),
//          userNameTextField.leadingAnchor
//              .constraint(equalToSystemSpacingAfter: leadingAnchor,
//                            multiplier: 1),
//          trailingAnchor
//              .constraint(equalToSystemSpacingAfter: userNameTextField.trailingAnchor,
//                            multiplier: 1)
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
    }
    
} // extension LoginView


// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
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
