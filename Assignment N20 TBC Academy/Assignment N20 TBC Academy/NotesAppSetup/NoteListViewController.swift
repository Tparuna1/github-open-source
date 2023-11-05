//
//  NoteListViewController.swift
//  Assignment N20 TBC Academy
//
//  Created by tornike <parunashvili on 05.11.23.
//

import UIKit

// MARK: - Note Structure

struct Note {
    var title: String
    var content: String
    
    var shortContent: String {
        return content.components(separatedBy: "\n").first ?? ""
    }
}

// MARK: - NoteListViewController

class NoteListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var notes: [Note] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoteCell")
        return tableView
    }()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    
    // MARK: - UI Setup
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemCyan
        tableView.layer.cornerRadius = 5
        view.addSubview(tableView)
    }

    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - Button Actions
    
    @objc private func addButtonTapped() {
        let addNoteViewController = AddNoteViewController()
        addNoteViewController.delegate = self
        navigationController?.pushViewController(addNoteViewController, animated: true)
    }
    
    
}

// MARK: - Table View Delegate and Data Source

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.shortContent
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailsVC = NoteDetailsViewController()
        noteDetailsVC.note = notes[indexPath.row]
        noteDetailsVC.noteIndex = indexPath.row
        noteDetailsVC.notes = notes
        noteDetailsVC.delegate = self
        navigationController?.pushViewController(noteDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - AddNoteDelegate

extension NoteListViewController: AddNoteDelegate {
    
    func didAddNote(_ note: Note) {
        notes.append(note)
        tableView.reloadData()
    }
    
    func didUpdateNote(_ note: Note, atIndex index: Int) {
        if index >= 0 && index < notes.count {
            notes[index] = note
            tableView.reloadData() 
        }
    }
}
