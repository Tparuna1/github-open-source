//
//  NetworkManagerTest.swift
//  CartViewModelTests
//
//  Created by tornike <parunashvili on 04.12.23.
//

import XCTest
@testable import UnitTestingAssignment


final class NetworkManagerTest: XCTestCase {
    
    func testFetchProductsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch products")
        
        NetworkManager.shared.fetchProducts { result in
            switch result {
            case .success(let products):
                XCTAssertNotNil(products)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success, but received error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}


