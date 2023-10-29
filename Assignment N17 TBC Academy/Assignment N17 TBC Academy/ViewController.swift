import UIKit

final class ViewController: UIViewController, AddSongViewControllerDelegate {
    // MARK: - Properties
    var songsTableDataSource: SongsTableDataSource!
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        songsTableDataSource = SongsTableDataSource()
        songsTableDataSource.view.frame = view.bounds

        addChild(songsTableDataSource)
        view.addSubview(songsTableDataSource.view)
        songsTableDataSource.didMove(toParent: self)

        navigationItem.title = "Playlist"

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = addButton

        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.leftBarButtonItem = editButton
    }

    // MARK: - Button Actions

    @objc func plusButtonTapped() {
        let addSongVC = AddSongViewController()
        addSongVC.delegate = self
        present(addSongVC, animated: true, completion: nil)
    }

    @objc func editButtonTapped() {
        let songsTableDataSource = children.first as? SongsTableDataSource
        songsTableDataSource?.isEditing = true

        let undoButton = UIBarButtonItem(title: "Undo", style: .plain, target: self, action: #selector(undoButtonTapped))
        navigationItem.leftBarButtonItems = [undoButton]
    }

    @objc func undoButtonTapped() {
        let songsTableDataSource = children.first as? SongsTableDataSource
        songsTableDataSource?.isEditing = false

        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.leftBarButtonItems = [editButton]
    }

    // MARK: - AddSongViewControllerDelegate
    func addSongViewController(_ controller: AddSongViewController, didAddSong singer: String, songName: String, songImage: UIImage?) {
        let songsTableDataSource = children.first as? SongsTableDataSource
        songsTableDataSource?.addSong(singer: singer, songName: songName, songImage: songImage)
    }
}

