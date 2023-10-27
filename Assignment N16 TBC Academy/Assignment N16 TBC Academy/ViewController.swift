import UIKit

class ViewController: UIViewController {
    // MARK: - View Lifecycle
    
    
    // MARK: - Properties
    
    private var profileImageView: UIImageView!
    private var userNameTextField: UITextField!
    private var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Images
        
        addBackgroundView(imageName: "Rectangle 4")
        profilePicture(imageName: "TockaPortrait", diameter: 100, topOffset: 55)
        
        view.bringSubviewToFront(profileImageView)
        
        // MARK: - Text Fields
        
        userNameTextField = createTextField()
        passwordTextField = createTextField()
        
        let leftPaddingView = createPaddingView()
                userNameTextField.leftView = leftPaddingView
                userNameTextField.leftViewMode = .always
        
        let rightPaddingView = createPaddingView()
        passwordTextField.rightView = rightPaddingView
        passwordTextField.rightViewMode = .always
        
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            userNameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 81),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 15)
        ])
        
        // MARK: - Sign In Button
        
        let signInButton = createSignInButton()
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            signInButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    
    
    // MARK: - Helper Functions
    
    func addBackgroundView(imageName: String) {
        let backgroundView = UIImageView(image: UIImage(named: imageName))
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.contentMode = .scaleAspectFill
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func profilePicture(imageName: String, diameter: CGFloat, topOffset: CGFloat) {
        profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = diameter / 2
        profileImageView.layer.masksToBounds = true
        
        profileImageView.image = UIImage(named: imageName)
        
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topOffset),
            profileImageView.widthAnchor.constraint(equalToConstant: diameter),
            profileImageView.heightAnchor.constraint(equalToConstant: diameter)
        ])
    }
    
    func createTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.698, alpha: 0.25).cgColor
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.698, green: 0.698, blue: 0.698, alpha: 0.25).cgColor
        return textField
    }
    func createPaddingView() -> UIView {
        let paddingView = UIView()
        paddingView.frame = CGRect(x: 0, y: 0, width: 16, height: 10)
        return paddingView
    }
    
    func createSignInButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1).cgColor
        button.layer.cornerRadius = 30
        button.setTitle("Sign In", for: .normal)
        return button
    }
    
    @objc func signInButtonTapped() {
        if let userName = userNameTextField.text, let password = passwordTextField.text, !userName.isEmpty, !password.isEmpty {
            let homePageVC = HomePageVC()
            self.present(homePageVC, animated: true)
        } else {
            print("Text fields are empty")
        }
    }
}

