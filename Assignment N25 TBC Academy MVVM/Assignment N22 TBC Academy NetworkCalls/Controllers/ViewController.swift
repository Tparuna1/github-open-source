//
//  ViewController.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 10.11.23.
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
    
    var results: [Movie] = []
    private var filteredResults: [Movie] = []
    let viewModel = MovieViewModel()
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        setupCustomNavigationBar()
        addHeaderLabel()
        setupStackView()
        
        viewModel.fetchMoviesFromAPI { [weak self] result in
            switch result {
            case .success(let movies):
                self?.results = movies
                DispatchQueue.main.async {
                    self?.setupCollectionView()
                }
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
        
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
            view.backgroundColor = backgroundColor
            setupCustomNavigationBar()
            addHeaderLabel()
            setupStackView()
        }
    
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
        layout.minimumLineSpacing = 64
        layout.minimumInteritemSpacing = 16
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
        results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        
        let movie = results[indexPath.row]
        let imageURL = "https://image.tmdb.org/t/p/original\(movie.posterPath)"
        
        loadImage(from: URL(string: imageURL)) { (image) in
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        
        cell.nameLabel.text = movie.title
        cell.idLabel.text = "\(movie.id)"
        cell.delegate = self
        
        return cell
    }
    
    func loadImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
// MARK: - MovieSelectionDelegate

extension ViewController: MovieSelectionDelegate {
    func didSelectMovie(movieName: String) {
        if let selectedMovie = results.first(where: { $0.title == movieName }) {
            let imageURLString = "https://image.tmdb.org/t/p/original\(selectedMovie.posterPath)"
            if let imageURL = URL(string: imageURLString) {
                URLSession.shared.dataTask(with: imageURL) { data, _, error in
                    if let imageData = data, let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            let movieDetailsViewModel = MovieDetailsViewModel(movie: selectedMovie, image: image)
                            let movieDetailedVC = MovieDetailedVC()
                            movieDetailedVC.viewModel = movieDetailsViewModel
                            self.navigationController?.pushViewController(movieDetailedVC, animated: true)
                        }
                    } else {
                        print("Error fetching image:", error?.localizedDescription ?? "Unknown error")
                    }
                }.resume()
            }
        } else {
            print("Selected movie not found in the results list.")
        }
    }
}
