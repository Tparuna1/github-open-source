//
//  MovieCell.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 10.11.23.
//

import UIKit


protocol MovieSelectionDelegate: AnyObject {
    func didSelectMovie(movieName: String)
}


final class MovieCell: UICollectionViewCell {

    // MARK: - Properties

    var imageView: UIImageView!
    var nameLabel: UILabel!
    var idLabel: UILabel!
    var heartButton: UIButton!
    var isFavorited: Bool = false
    weak var delegate: MovieSelectionDelegate?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupTapGesture()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // MARK: - UI Setup

    private func setupViews() {
        setupImageView()
        setupHeartButton()
        setupNameLabel()
        setupIdLabel()
    }

    private func setupImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func setupHeartButton() {
        heartButton = UIButton()
        let unfilledHeartImage = UIImage(named: "heartunfilled")
        let filledHeartImage = UIImage(named: "heartfilled")

        heartButton.setImage(unfilledHeartImage, for: .normal)
        heartButton.setImage(filledHeartImage, for: .selected)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        addSubview(heartButton)

        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            heartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            heartButton.widthAnchor.constraint(equalToConstant: 24.0),
            heartButton.heightAnchor.constraint(equalToConstant: 24.0),
        ])
    }

    private func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "PTRootUI-Bold", size: 16)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8.0),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
        ])
    }

    private func setupIdLabel() {
        idLabel = UILabel()
        idLabel.font = UIFont(name: "PTRootUI-Regular", size: 14)
        idLabel.textColor = .gray
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(idLabel)

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
        ])
    }

    // MARK: - Action Handlers

    @objc private func imageTapped() {
        delegate?.didSelectMovie(movieName: nameLabel.text ?? "")
    }

    @objc private func heartButtonTapped() {
        isFavorited.toggle()
        heartButton.isSelected = isFavorited
    }

    private func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.isUserInteractionEnabled = true
    }
}
