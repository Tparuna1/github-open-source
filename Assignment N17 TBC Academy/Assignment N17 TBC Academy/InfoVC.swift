import UIKit

final class InfoViewController: UIViewController {
    // MARK: - Properties
    var singer: String?
    var songName: String?
    var songImage: UIImage?
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let songLabel = UILabel()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        imageView.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 200)
        imageView.contentMode = .scaleAspectFit
        imageView.image = songImage
        view.addSubview(imageView)
        
        nameLabel.text = singer
        nameLabel.frame = CGRect(x: 20, y: 320, width: view.frame.width - 40, height: 30)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        songLabel.text = songName
        songLabel.frame = CGRect(x: 20, y: 360, width: view.frame.width - 40, height: 30)
        songLabel.textAlignment = .center
        view.addSubview(songLabel)
    }
}

