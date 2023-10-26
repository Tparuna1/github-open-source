//
//  ViewController.swift
//  Assugnment N 15 TBC Academy
//
//  Created by tornike <parunashvili on 25.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var backPageImage: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var beansIcon: UIImageView!
    @IBOutlet weak var milkIcon: UIImageView!
    @IBOutlet weak var starIcon: UIImageView!
    
    @IBOutlet weak var topNameLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var detailedDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceInNumbersLabel: UILabel!
    
    @IBOutlet weak var smallSizeButton: UIButton!
    @IBOutlet weak var mediumSizeButton: UIButton!
    @IBOutlet weak var largeSizeButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: - View Controller Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(named: "Rectangle 1706") {
            mainImageView.image = image
        } else {
            printContent("Can not load Image")
        }
        
        
        
        detailedDescriptionLabel.textColor = UIColor(white: 0.608, alpha: 1)
        detailedDescriptionLabel.font = UIFont(name: "Sora-Regular", size: 14)
        detailedDescriptionLabel.numberOfLines = 0
        detailedDescriptionLabel.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        detailedDescriptionLabel.attributedText = NSMutableAttributedString(
            string: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo... Read More",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        
        configureSizeButton(smallSizeButton, backgroundColor: .white, borderColor: UIColor(white: 0.871, alpha: 1))
        configureSizeButton(mediumSizeButton, backgroundColor: UIColor(red: 1, green: 0.959, blue: 0.933, alpha: 1), borderColor: UIColor(red: 0.776, green: 0.486, blue: 0.306, alpha: 1))
        configureSizeButton(largeSizeButton, backgroundColor: .white, borderColor: UIColor(white: 0.871, alpha: 1))
        
        buyButton.backgroundColor = UIColor(red: 0.776, green: 0.486, blue: 0.306, alpha: 1)
        buyButton.layer.cornerRadius = 16
        
        configurePriceLabel(priceLabel, textColor: UIColor(white: 0.608, alpha: 1), font: UIFont(name: "Sora-Regular", size: 14), text: "Price")
        configurePriceLabel(priceInNumbersLabel, textColor: UIColor(red: 0.776, green: 0.486, blue: 0.306, alpha: 1), font: UIFont(name: "Sora-SemiBold", size: 18), text: "$ 4.53")
        
        configureRateLabel(rateLabel, textColor: UIColor(red: 0.184, green: 0.176, blue: 0.173, alpha: 1), font: UIFont(name: "Sora-SemiBold", size: 16), text: "4.8 (230) ")
        
        configureDescriptionLabel(descriptionLabel, textColor: UIColor(red: 0.183, green: 0.178, blue: 0.174, alpha: 1), font: UIFont(name: "Sora-SemiBold", size: 16), text: "Description")
        
        configureTypeLabel(typeLabel, textColor: UIColor(red: 0.608, green: 0.608, blue: 0.608, alpha: 1), font: UIFont(name: "Sora-Regular", size: 12), text:  "with Chocolate")
        
        configureProductNameLabel(productNameLabel, textColor: UIColor(red: 0.183, green: 0.178, blue: 0.174, alpha: 1), font: UIFont(name: "Sora-SemiBold", size: 20), text: "Cappucino")
        
        
    }
    
    // MARK: - Functions
    
    private func configureSizeButton(_ button: UIButton, backgroundColor: UIColor, borderColor: UIColor) {
        button.frame = CGRect(x: 0, y: 0, width: 96, height: 43)
        button.layer.backgroundColor = backgroundColor.cgColor
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = borderColor.cgColor
    }
    
    private func configurePriceLabel(_ label: UILabel, textColor: UIColor, font: UIFont?, text: String) {
        label.frame = CGRect(x: 0, y: 0, width: 37, height: 18)
        label.textColor = textColor
        label.font = font
        label.text = text
    }
    
    private func configureRateLabel(_ label: UILabel, textColor: UIColor, font: UIFont?, text: String) {
        label.frame = CGRect(x: 0, y: 0, width: 62, height: 20)
        label.textColor = textColor
        label.font = font
        label.text = text
    }
    
    private func configureDescriptionLabel(_ label: UILabel, textColor: UIColor, font: UIFont?, text: String) {
        label.frame = CGRect(x: 0, y: 0, width: 98, height: 20)
        label.textColor = textColor
        label.font = font
        label.text = text
    }
    
    private func configureTypeLabel(_ label: UILabel, textColor: UIColor, font: UIFont?, text: String) {
        label.frame = CGRect(x: 0, y: 0, width: 93, height: 15)
        label.textColor = textColor
        label.font = font
        label.text = text
    }
    
    private func configureProductNameLabel(_ label: UILabel, textColor: UIColor, font: UIFont?, text: String) {
        label.frame = CGRect(x: 0, y: 0, width: 114, height: 25)
        label.textColor = textColor
        label.font = font
        label.text = text
    }
    
}
    
    



