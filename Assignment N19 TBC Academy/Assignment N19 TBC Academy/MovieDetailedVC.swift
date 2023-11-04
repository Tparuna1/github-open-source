//
// MovieDetailedVC.swift
// Assignment N19 TBC Academy
//
// Created by Tornike Parunashvili on 04.11.23.
//

import UIKit

final class MovieDetailedVC: UIViewController {
    
    // MARK: - Properties
    
    var movieName: String?
    let backgroundColor = UIColor(red: 0.102, green: 0.133, blue: 0.196, alpha: 1.0)

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor

        let titleLabel = UILabel()
        titleLabel.text = movieName ?? "Info will be added soon"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
