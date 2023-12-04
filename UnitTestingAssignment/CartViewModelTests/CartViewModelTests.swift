//
//  CartViewModelTests.swift
//  CartViewModelTests
//
//  Created by tornike <parunashvili on 03.12.23.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUp() {
        super.setUp()
        cartViewModel = CartViewModel()
    }
    
    override func tearDown() {
        cartViewModel = nil
        super.tearDown()
    }
    
    func testSelectedItemsQuantityInitiallyZero() {
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 0)
    }
    
    
    func testTotalPriceInitiallyZero() {
        XCTAssertEqual(cartViewModel.totalPrice, 0.0)
    }
    
    func testAddProductIncreasesSelectedItemsQuantity() {
        cartViewModel.addProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 0)
    }
    
    func testAddProductIncreasesTotalPrice() {
        let product = Product(id: 1, title: "Title", description: "Description", price: 10.0, selectedQuantity: 2)
        cartViewModel.addProduct(product: product)
        
        XCTAssertEqual(cartViewModel.totalPrice, 20.0)
    }
    
    func testAddProductWithIDAddsToSelectedProducts() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 2)
        cartViewModel.allproducts = [product]
        let initialSelectedProductsCount = cartViewModel.selectedProducts.count
        
        cartViewModel.addProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, initialSelectedProductsCount + 1, "Product should be added to selected products")
    }
    
    func testRemoveProductRemovesFromSelectedProducts() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 2)
        cartViewModel.selectedProducts = [product]
        
        cartViewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0, "Product should be removed from selected products")
    }
    
    func testRemoveProductDecreasesSelectedItemsQuantity() {
        cartViewModel.addProduct(withID: 1)
        cartViewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 0)
    }
    
    func testClearCartEmptiesSelectedProducts() {
        cartViewModel.addProduct(withID: 1)
        cartViewModel.addProduct(withID: 2)
        cartViewModel.clearCart()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
    
    func testFetchProducts() {
        let expectation = XCTestExpectation(description: "Fetch products")
        
        cartViewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertNotNil(self.cartViewModel.allproducts)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testAddProductWithInvalidID() {
        cartViewModel.addProduct(withID: 999)
        
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 0)
    }
}
