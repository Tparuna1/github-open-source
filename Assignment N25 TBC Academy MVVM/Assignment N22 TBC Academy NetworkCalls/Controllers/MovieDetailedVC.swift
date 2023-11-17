//
//  MovieDetailedVC.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 10.11.23.
//

import UIKit

final class MovieDetailedVC: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: MovieDetailsViewModel?
    let backgroundColor = UIColor(red: 0.102, green: 0.133, blue: 0.196, alpha: 1.0)
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        setupView()
    }
    
    // MARK: UI Setup
    
    private func setupView() {
        guard let movieDetailed = viewModel?.movieDetailed else {
            showPlaceholderMessage()
            return
        }
        
        configureImageView(for: movieDetailed)
        configureTitleLabel(for: movieDetailed)
        configureOverviewLabel(for: movieDetailed)
    }
    
    
    private func configureTitleLabel(for movieDetailed: MovieDetailed) {
        let titleLabel = UILabel()
        titleLabel.text = movieDetailed.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func configureOverviewLabel(for movieDetailed: MovieDetailed) {
        let overviewLabel = UILabel()
        overviewLabel.text = movieDetailed.overview
        overviewLabel.textColor = .white
        overviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        overviewLabel.textAlignment = .left
        overviewLabel.numberOfLines = 0
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func configureImageView(for movieDetailed: MovieDetailed) {
        guard let movieImage = movieDetailed.movieImage else {
            return
        }
        
        let imageView = UIImageView(image: movieImage)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    // MARK: - Private Methods
    
    private func showPlaceholderMessage() {
        let placeholderLabel = UILabel()
        placeholderLabel.text = "No movie data available."
        placeholderLabel.textColor = .white
        placeholderLabel.textAlignment = .center
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(placeholderLabel)
        
        NSLayoutConstraint.activate([
            placeholderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

