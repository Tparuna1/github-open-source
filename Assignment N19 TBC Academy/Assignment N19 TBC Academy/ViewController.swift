//
// ViewController.swift
// Assignment N19 TBC Academy
//
// Created by Tornike Parunashvili on 04.11.23.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    weak var movieSelectionDelegate: MovieSelectionDelegate?
    
    let backgroundColor = UIColor(red: 0.102, green: 0.133, blue: 0.196, alpha: 1.0)
    let movieNames = ["The Batman", "Uncharted", "Exorcism Of God", "Morbius", "Spider Man", "Turning Red"]
    let genreNames = ["Action", "Adventure", "Horror", "Action", "Action", "Animation"]
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        setupCustomNavigationBar()
        addHeaderLabel()
        setupStackView()
        setupCollectionView()
    }
    
    // MARK: - UI Setup
    
    private func setupCustomNavigationBar() {
        let customNavBar = UIView()
        customNavBar.backgroundColor = backgroundColor
        customNavBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customNavBar)
        
        let leftIcon = UIImageView(image: UIImage(named: "Logo"))
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        customNavBar.addSubview(leftIcon)
        
        let rightIcon = UIImageView(image: UIImage(named: "Button"))
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        customNavBar.addSubview(rightIcon)
        
        NSLayoutConstraint.activate([
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 44.0),
            
            leftIcon.leadingAnchor.constraint(equalTo: customNavBar.leadingAnchor, constant: 16.0),
            leftIcon.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor),
            leftIcon.widthAnchor.constraint(equalToConstant: 48.0),
            leftIcon.heightAnchor.constraint(equalToConstant: 48.0),
            
            rightIcon.trailingAnchor.constraint(equalTo: customNavBar.trailingAnchor, constant: -16.0),
            rightIcon.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor),
            rightIcon.widthAnchor.constraint(equalToConstant: 77.0),
            rightIcon.heightAnchor.constraint(equalToConstant: 40.0),
        ])
    }
    
    private func addHeaderLabel() {
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 0, y: 0, width: 342, height: 29)
        headerLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        headerLabel.font = UIFont(name: "Inter-Bold", size: 24)
        headerLabel.text = "Now in cinemas"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalToConstant: 342),
            headerLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 64.0
        layout.minimumInteritemSpacing = 16.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2.0, bottom: 16.0, right: 2.0)
        layout.itemSize = CGSize(width: 164, height: 230)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.backgroundColor = backgroundColor
        stackView.addArrangedSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        
        let imageNames = ["picOne", "picTwo", "picThree", "picFour", "picFive", "picSix"]
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        cell.nameLabel.text = movieNames[indexPath.row]
        cell.genreLabel.text = genreNames[indexPath.row]
        cell.delegate = self
        
        return cell
    }
}

// MARK: - MovieSelectionDelegate

extension ViewController: MovieSelectionDelegate {
    
    func didSelectMovie(movieName: String) {
        let movieDetailedVC = MovieDetailedVC()
        navigationController?.pushViewController(movieDetailedVC, animated: true)
    }
}
