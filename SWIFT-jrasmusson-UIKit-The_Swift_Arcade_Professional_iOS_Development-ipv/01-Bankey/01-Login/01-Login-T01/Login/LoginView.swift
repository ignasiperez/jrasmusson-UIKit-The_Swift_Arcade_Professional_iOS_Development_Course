//
//  LoginView.swift
//  Bankey
//
//  Created by Ignasi Perez-Valls on 27/8/23.
//

import UIKit

class LoginView: UIView {
    
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
    }
    
    func layout() {
        
    }
    
} // extension LoginView
