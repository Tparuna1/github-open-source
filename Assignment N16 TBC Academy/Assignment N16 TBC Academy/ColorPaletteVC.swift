import UIKit

protocol ColorPaletteDelegate: AnyObject {
    func changeButtonColors(to color: UIColor)
    func changeBackgroundColor(to color: UIColor)
}

class ColorPaletteVC: UIViewController, ColorPaletteDelegate {
    // MARK: - Properties
    
    weak var delegate: ColorPaletteDelegate?
    private var buttonColorsStackView: UIStackView!
    private var backgroundColorsStackView: UIStackView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Background Setup
        
        view.backgroundColor = .white
        
        // MARK: - Back Button
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(goBackToHomePage), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        // MARK: - UI Elements
        
        let labelOne = createLabel(text: "Change Home Buttons Background Colors")
        buttonColorsStackView = createColorButtonStack()
        
        let labelTwo = createLabel(text: "Change Home Background Color")
        backgroundColorsStackView = createColorButtonStack()
        
        let stackView = UIStackView(arrangedSubviews: [labelOne, buttonColorsStackView, labelTwo, backgroundColorsStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        for button in buttonColorsStackView.arrangedSubviews + backgroundColorsStackView.arrangedSubviews {
            if let button = button as? UIButton {
                button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
            }
        }
    }
    
    // MARK: - Button Actions
    
    @objc func goBackToHomePage() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func colorButtonTapped(sender: UIButton) {
        if let color = sender.backgroundColor {
            if isButtonInFirstStack(sender) {
                delegate?.changeButtonColors(to: color)
            } else if isButtonInSecondStack(sender) {
                delegate?.changeBackgroundColor(to: color)
            }
        }
    }
    
    // MARK: - Helper Functions
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createColorButtonStack() -> UIStackView {
        let colors: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]
        var buttons: [UIButton] = []
        
        for color in colors {
            let button = createButton(color: color)
            buttons.append(button)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }
    
    func createButton(color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        button.layer.cornerRadius = 20
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }
    
    func isButtonInFirstStack(_ button: UIButton) -> Bool {
        return buttonColorsStackView.arrangedSubviews.contains(button)
    }
    
    func isButtonInSecondStack(_ button: UIButton) -> Bool {
        return backgroundColorsStackView.arrangedSubviews.contains(button)
    }
    
    // MARK: - Delegate Methods
    
    func changeButtonColors(to color: UIColor) {
        // This method should be implemented in the delegate
    }
    
    func changeBackgroundColor(to color: UIColor) {
        // This method should be implemented in the delegate
    }
}

