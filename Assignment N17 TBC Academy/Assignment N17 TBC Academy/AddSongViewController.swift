import UIKit

protocol AddSongViewControllerDelegate: AnyObject {
    func addSongViewController(_ controller: AddSongViewController, didAddSong singer: String, songName: String, songImage: UIImage?)
}

final class AddSongViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properties
    let singerTextField = UITextField()
    let songNameTextField = UITextField()
    weak var delegate: AddSongViewControllerDelegate?
    private var selectedImage: UIImage?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectImageButton = UIButton(type: .system)
        selectImageButton.setTitle("Upload Image", for: .normal)
        selectImageButton.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 40)
        selectImageButton.addTarget(self, action: #selector(selectImageTapped), for: .touchUpInside)
        view.addSubview(selectImageButton)
        
        view.backgroundColor = .white
        
        singerTextField.placeholder = "Singer Name"
        singerTextField.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        view.addSubview(singerTextField)
        
        songNameTextField.placeholder = "Song Name"
        songNameTextField.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 40)
        view.addSubview(songNameTextField)
        
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.frame = CGRect(x: 20, y: 270, width: view.frame.width - 40, height: 40)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
    }

    // MARK: - Button Actions
    @objc func saveButtonTapped() {
        if let singer = singerTextField.text, let songName = songNameTextField.text {
            delegate?.addSongViewController(self, didAddSong: singer, songName: songName, songImage: selectedImage)
        }
        dismiss(animated: true, completion: nil)
    }

    @objc func selectImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            self.selectedImage = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

