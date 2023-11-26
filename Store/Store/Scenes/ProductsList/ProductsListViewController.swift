//
//  ProductsListViewController.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import UIKit

final class ProductsListViewController: UIViewController {
    
    private let productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .purple
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.style = .large
        indicator.color = .white
        return indicator
    }()
    
    private let totalPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "total: 0$"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    private let productsViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupProductsViewModel()
        productsViewModel.viewDidLoad()
        activityIndicator.startAnimating()
        productsTableView.dataSource = self
        productsTableView.delegate = self
        
    }
    
    //MARK: setup UI
    private func setupUI() {
        view.backgroundColor = .orange
        setupTableView()
        setupIndicator()
        setupTotalPriceLbl()
    }
    
    private func setupTableView() {
        view.addSubview(productsTableView)
        
    
        NSLayoutConstraint.activate([
            productsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        productsTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
    }
    
    private func setupIndicator() {
        
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTotalPriceLbl() {
        view.addSubview(totalPriceLbl)
        
        NSLayoutConstraint.activate([
            totalPriceLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalPriceLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            totalPriceLbl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: Setup delegates
    private func setupProductsViewModel() {
        productsViewModel.delegate = self
    }
}

extension ProductsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let currentProduct = productsViewModel.products?[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
        else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.reload(with: currentProduct)
        return cell
    }
}

extension ProductsListViewController: ProductsListViewModelDelegate {
    
    func productsAmountChanged() {

        totalPriceLbl.text = "Total price: \(productsViewModel.totalPrice ?? 0)"
        productsTableView.reloadData()
    }
    
    func productsFetched() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.productsTableView.reloadData()
        }
    }
    // გამოვიყენეთ DispatchQueue.main.async UI ის thread-safe დასააფდეითებლად
}

extension ProductsListViewController: ProductCellDelegate {
    
    func removeProduct(for cell: ProductCell) {
        if let indexPath = productsTableView.indexPath(for: cell) {
            productsViewModel.removeProduct(at: indexPath.row)
        }
    }
    
    func addProduct(for cell: ProductCell) {
        if let indexPath = productsTableView.indexPath(for: cell) {
            productsViewModel.addProduct(at: indexPath.row)
        }
    }
}


