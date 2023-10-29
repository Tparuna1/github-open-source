import UIKit

final class SongsTableDataSource: UITableViewController, UISearchResultsUpdating {
    
    // MARK: - Properties
    var songs: [(singer: String, songName: String, songImage: UIImage?)] = []
    var filteredSongs: [(singer: String, songName: String, songImage: UIImage?)] = []
    var searchController: UISearchController!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelectionDuringEditing = true
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Songs"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        let newSongs: [(singer: String, songName: String, songImage: UIImage?)] = [
            ("Barry White", "let The music Play", UIImage(named: "Barry")),
            ("Barry White", "You see trouble with me", UIImage(named: "Barry")) ,
            ("Ray Charles", "I can't stop Loving you", UIImage(named: "Ray")),
            ("Ray Charles", "Cry", UIImage(named: "Ray")),
            ("Aretha Franklin", "I say a little Prayer", UIImage(named: "Aretha")),
        ]
        
        songs.append(contentsOf: newSongs)
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = "\(song.singer) - \(song.songName)"
        
        if let songImage = song.songImage {
            let circularImage = circularImage(with: songImage)
            cell.imageView?.image = circularImage
        } else {
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    // MARK: - Custom Methods
    func addSong(singer: String, songName: String, songImage: UIImage?) {
        let newSong = (singer: singer, songName: songName, songImage: songImage)
        songs.append(newSong)
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        
        let infoVC = InfoViewController()
        infoVC.singer = song.singer
        infoVC.songName = song.songName
        infoVC.songImage = song.songImage
        
        navigationController?.pushViewController(infoVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedSong = songs.remove(at: sourceIndexPath.row)
        songs.insert(movedSong, at: destinationIndexPath.row)
    }
    
    // MARK: - UISearchResultsUpdating Method
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredSongs = songs.filter { (singer, songName, _) in
                return singer.localizedCaseInsensitiveContains(searchText) || songName.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            filteredSongs = songs
        }
        
        tableView.reloadData()
    }
    func circularImage(with image: UIImage?) -> UIImage? {
        guard let image = image else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()
        let radius = min(image.size.width, image.size.height) / 2.0
        
        context?.addArc(center: CGPoint(x: image.size.width / 2.0, y: image.size.height / 2.0), radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        context?.closePath()
        context?.clip()
        
        image.draw(in: CGRect(origin: .zero, size: image.size))
        let circularImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return circularImage
    }
    
}

