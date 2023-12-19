//
//  ProductsPageView.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import SwiftUI
import Foundation



struct ProductsPageView: View {
    @State var viewModel = ProductsViewModel()
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var showCheckoutAlert = false

    
    
    var body: some View {
        VStack {
            HStack {
                
                Image(systemName: "cart")
                Text("Cart (\(viewModel.cartItemCount))")
                    .font(.headline)
                    .padding()
                Spacer()
                Text("Balance: \(viewModel.balanceFormatted)")
                    .font(.headline)
                    .padding()
            }
            .background(Color.cyan)
            .foregroundColor(.white)
            
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 16) {
                    ForEach(viewModel.products) { product in
                        ProductView(product: product, viewModel: viewModel)
                            .padding(8)
                    }
                }
                .padding()
                .onAppear {
                    viewModel.fetchProducts()
                }
            }
            HStack {
                Text("Total Price: \(viewModel.cartTotalPrice, specifier: "%.2f") USD")
                    .font(.headline)
                    .padding()
                Spacer()
            }
            
            Button("Checkout") {
                viewModel.performCheckout()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showCheckoutAlert = true
                }
            }
            .foregroundColor(.white)
            .background(Color.cyan)
            .cornerRadius(8)
            .buttonStyle(BorderedButtonStyle())
        }
        .alert(isPresented: $showCheckoutAlert) {
            Alert(title: Text("Payment Successful"), message: Text("Your payment was successful."), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Insufficient Balance"), message: Text("You don't have enough balance."), dismissButton: .default(Text("OK")))
        }
    }
}




struct ProductView: View {
    let product: Products
    @State var viewModel: ProductsViewModel
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            RemoteImage(url: product.thumbnail)
                .frame(height: 150)
            
            Text(product.title)
                .font(.headline)
            Text("Brand: \(product.brand)")
                .font(.subheadline)
            Text("Price: $\(product.price)")
                .font(.subheadline)
            Text("Stock: \(product.stock)")
                .font(.subheadline)
            
            
            
            Button("Add To Cart") {
                viewModel.addToCart(product)
            }
            .foregroundColor(.white)
            .background(Color.cyan)
            .cornerRadius(8)
            .buttonStyle(BorderedButtonStyle())
            .padding()
        }
        .background(Color.gray)
        .cornerRadius(8)
    }
}


#Preview {
    ProductsPageView()
}
