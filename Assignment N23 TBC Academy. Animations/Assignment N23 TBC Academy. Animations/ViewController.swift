//
//  ViewController.swift
//  Assignment N23 TBC Academy. Animations
//
//  Created by tornike <parunashvili on 11.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupTitleLabel()
        
        
        let navigateButton = UIBarButtonItem(title: "Task 2", style: .plain, target: self, action: #selector(navigateToBackgroundGradingVC))
        navigationItem.rightBarButtonItem = navigateButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupGradientBackground()
        setupTitleLabel()
    }
    
    // MARK: - Setup Animated Label
    
    func setupTitleLabel() {
        let label = UILabel()
        label.text = "ჩნდება..."
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
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            label.transform = CGAffineTransform(translationX: 0, y: 50)
            label.alpha = 0.0
        })
    }
    
    // MARK: - Version 2
    
    //    func animate() {
    //        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseInOut], animations: {
    //            label.transform = CGAffineTransform(translationX: 0, y: -50)
    //        }) { (finished) in
    //            UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseInOut], animations: {
    //                label.transform = .identity
    //                label.alpha = 0.0
    //            }) { (finished) in
    //                label.alpha = 1.0
    //
    //                animate()
    //            }
    //        }
    //    }
    //    animate()
    //}
    
    // MARK: - Setup Background Color
    
    func setupGradientBackground() {
        view.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - Setup Navigation
    
    @objc func navigateToBackgroundGradingVC() {
        let backgroundGradingVC = BackgroundGradingVC()
        navigationController?.pushViewController(backgroundGradingVC, animated: true)
    }
}

