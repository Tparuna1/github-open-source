//
//  AddNoteViewController.swift
//  Assignment N20 TBC Academy
//
//  Created by tornike <parunashvili on 05.11.23.
//

import UIKit

// MARK: - AddNoteDelegate Protocol

protocol AddNoteDelegate: AnyObject {
    func didAddNote(_ note: Note)
    func didUpdateNote(_ note: Note, atIndex index: Int)
}

// MARK: - AddNoteViewController

class AddNoteViewController: UIViewController {
    weak var delegate: AddNoteDelegate?
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Bold", size: 40)
        label.text = "Add Your Note Here"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let noteTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your note here"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
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
        setupUI()
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(noteTextField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noteTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            noteTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            noteTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            addButton.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Button Action
    
    @objc private func addButtonTapped() {
        guard let noteText = noteTextField.text, !noteText.isEmpty else {
            showAlert(message: "Please enter a note.")
            return
        }
        
        let note = Note(title: "Title", content: noteText)
        delegate?.didAddNote(note)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Method
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
