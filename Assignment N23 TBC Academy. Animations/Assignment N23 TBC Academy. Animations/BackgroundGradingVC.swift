//
//  BackgroundGradingVC.swift
//  Assignment N23 TBC Academy. Animations
//
//  Created by tornike <parunashvili on 11.11.23.
//

import UIKit

class BackgroundGradingVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupGradientBackground()
        setupTitleLabel()
        animateTitleLabelRotation()
        animateGradientColors()
        
    }
    
    // MARK: - Setup Animated Label
    
    func setupTitleLabel() {
        let label = UILabel()
        label.text = "ბედის ბორბალი"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func animateTitleLabelRotation() {
        let label = self.view.subviews.first

        label?.alpha = 0
        let originalCenter = self.view.center
        label?.center = originalCenter
        label?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: -.pi)

        UIView.animate(withDuration: 3, animations: {
            label?.alpha = 1
            label?.transform = CGAffineTransform.identity
        }) { _ in
            UIView.animateKeyframes(withDuration: 9, delay: 0, options: [.repeat], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    label?.transform = label?.transform.rotated(by: -.pi) ?? CGAffineTransform.identity
                })

                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    label?.transform = label?.transform.rotated(by: -.pi) ?? CGAffineTransform.identity
                })
            }, completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    label?.alpha = 0
                })
            })
        }
    }
    
    // MARK: - Setup Animated Background
    
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func animateGradientColors() {
        let gradientLayer = (view.layer.sublayers?.first as? CAGradientLayer)!
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        colorAnimation.toValue = [UIColor.systemOrange.cgColor, UIColor.systemRed.cgColor]
        colorAnimation.duration = 4
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = .infinity
        
        gradientLayer.add(colorAnimation, forKey: "gradientColorChange")
    }
    
}
