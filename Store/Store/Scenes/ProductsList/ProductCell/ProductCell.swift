//
//  ProductCell.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import UIKit

protocol ProductCellDelegate: AnyObject {
    func removeProduct(for cell: ProductCell)
    func addProduct(for cell: ProductCell)
}

final class ProductCell: UITableViewCell {
    
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var prodTitleLbl: UILabel!
    @IBOutlet weak var stockLbl: UILabel!
    @IBOutlet weak var descrLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var selectedQuantityLbl: UILabel!
    @IBOutlet weak var quantityModifierView: UIView!
    @IBOutlet weak var addProduct: UIButton!
    @IBOutlet weak var removeProduct: UIButton!

    weak var delegate: ProductCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        addProduct.isUserInteractionEnabled = true
        removeProduct.isUserInteractionEnabled = true

        
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            prodImageView.image = nil
            prodTitleLbl.text = nil
            stockLbl.text = nil
            descrLbl.text = nil
            priceLbl.text = nil
            selectedQuantityLbl.text = nil
    }
    // Added prepareForReuse
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupUI(){
        quantityModifierView.layer.cornerRadius = 5
        quantityModifierView.layer.borderWidth = 1
        quantityModifierView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func reload(with product: ProductModel) {
        //TODO: reload images are not correct when reloading list after changing quantity
        prodImageView.image = UIImage(named: "placeholderImage")
        setImage(from: product.thumbnail)
        prodTitleLbl.text = product.title
        stockLbl.text = "\(product.stock)"
        descrLbl.text = "\(product.description)"
        priceLbl.text = "\(product.price)$"
        selectedQuantityLbl.text = "\(product.selectedAmount ?? 0)"
    }
    
    private func setImage(from url: String) {
        
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            DispatchQueue.main.async {
                if self?.prodImageView.image == UIImage(named: "placeholderImage") {
                    self?.prodImageView.image = image
                }
            }
        }
    }
    
    @IBAction private func addProduct(_ sender: Any) {
        delegate?.addProduct(for: self)
    }
    
    @IBAction private func removeProduct(_ sender: Any) {
        delegate?.removeProduct(for: self)
    }
    
}
