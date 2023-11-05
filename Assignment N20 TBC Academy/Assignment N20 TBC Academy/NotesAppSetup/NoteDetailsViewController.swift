//
//  NoteDetailsViewController.swift
//  Assignment N20 TBC Academy
//
//  Created by tornike <parunashvili on 05.11.23.
//


import UIKit

protocol NoteDetailsDelegate: AnyObject {
    func didUpdateNote(_ note: Note, atIndex index: Int)
}

class NoteDetailsViewController: UIViewController {
    
    var note: Note?
    var noteIndex: Int?
    var notes: [Note]?
    weak var delegate: AddNoteDelegate?
    
    
    // MARK: - UI Elements
    
    private let noteTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var editButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
    }()
    
    private lazy var saveButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        if let note = note {
            noteTextView.text = note.content
        }
        
        navigationItem.rightBarButtonItems = [editButton]
        navigationItem.leftItemsSupplementBackButton = true
        
        setupConstraints()
    }
    
    // MARK: - UI Setup
    
    private func setupConstraints() {
        view.addSubview(noteTextView)
        
        NSLayoutConstraint.activate([
            noteTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            noteTextView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            noteTextView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            noteTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Button Actions
    
    @objc private func editButtonTapped() {
        noteTextView.isEditable = true
        navigationItem.setRightBarButton(saveButton, animated: true)
    }
    
    @objc private func saveButtonTapped() {
        if let updatedContent = noteTextView.text, let noteIndex = noteIndex, let notes = notes, noteIndex >= 0, noteIndex < notes.count {
            var mutableNotes = notes
            mutableNotes[noteIndex].content = updatedContent
            self.notes = mutableNotes
            delegate?.didUpdateNote(mutableNotes[noteIndex], atIndex: noteIndex)
            noteTextView.isEditable = false
            navigationItem.setRightBarButton(editButton, animated: true)
        }
    }
}

