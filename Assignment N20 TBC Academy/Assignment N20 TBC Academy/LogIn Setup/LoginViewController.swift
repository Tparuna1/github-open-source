//
//  LoginViewController.swift
//  Assignment N20 TBC Academy
//
//  Created by tornike <parunashvili on 05.11.23.
//

import UIKit
import Security

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    let firstTimeLoginKey = "FirstTimeLogin"
    
    // MARK: - UI Elements
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupSubviews()
        UserDefaults.standard.set(true, forKey: firstTimeLoginKey)
    }
    
    // MARK: - UI Setup
    
    private func setupSubviews() {
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Actions
    
    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            showAlert(message: "Please enter both username and password.")
            return
        }
        
        if isFirstTimeLogin(username: username, password: password) {
            showAlert(message: "Hello, it is your first time here")
        }
        
        UserDefaults.standard.set(username, forKey: "SavedUsername")
        UserDefaults.standard.set(password, forKey: "SavedPassword")
        
        KeychainManager.saveUserCredentials(username: username, password: password)
        
        let noteListViewController = NoteListViewController()
        navigationController?.pushViewController(noteListViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func isFirstTimeLogin(username: String, password: String) -> Bool {
        if let savedUsername = UserDefaults.standard.string(forKey: "SavedUsername"),
           let savedPassword = UserDefaults.standard.string(forKey: "SavedPassword") {
            return savedUsername != username || savedPassword != password
        }
        return true
    }
}

