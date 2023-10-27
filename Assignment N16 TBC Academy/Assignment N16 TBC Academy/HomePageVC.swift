import UIKit

class HomePageVC: UIViewController, ColorPaletteDelegate {
    // MARK: - Properties
    
    var presentButton: UIButton!
    var pushButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UI Setup
        
        presentButton = createButton(title: "Present Colour Palette Page")
        pushButton = createButton(title: "Push Colour Palette")
        
        view.addSubview(presentButton)
        view.addSubview(pushButton)
        
        // MARK: - Button Constraints
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
        
        // MARK: - Button Actions
        
        presentButton.addTarget(self, action: #selector(presentColorPalettePage), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushColorPalette), for: .touchUpInside)
    }
    
    // MARK: - Helper Functions
    
    func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        button.layer.cornerRadius = 30
        button.setTitle(title, for: .normal)
        return button
    }
    
    // MARK: - Button Actions
    
    @objc func presentColorPalettePage() {
        let colorPaletteVC = ColorPaletteVC()
        colorPaletteVC.delegate = self
        colorPaletteVC.modalPresentationStyle = .fullScreen
        self.present(colorPaletteVC, animated: true, completion: nil)
    }
    
    @objc func pushColorPalette() {
        let colorPaletteVC = ColorPaletteVC()
        pushButton.addTarget(self, action: #selector(pushColorPalette), for: .touchUpInside)
        navigationController?.pushViewController(colorPaletteVC, animated: true)
    }
    
    // MARK: - ColorPaletteDelegate Methods
    
    func changeButtonColors(to color: UIColor) {
        presentButton.backgroundColor = color
        pushButton.backgroundColor = color
    }
    
    func changeBackgroundColor(to color: UIColor) {
        self.view.backgroundColor = color
    }
}

