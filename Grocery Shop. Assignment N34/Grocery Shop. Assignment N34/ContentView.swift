//
//  ContentView.swift
//  Grocery Shop. Assignment N34
//
//  Created by tornike <parunashvili on 09.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainPageViewModel()
    @State private var isRemoving = true
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(viewModel.groceriesList.indices, id: \.self) { index in
                        let product = viewModel.groceriesList[index]
                        
                        HStack {
                            Image(product.productImageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                            
                            VStack(alignment: .leading) {
                                Text(product.productName)
                                    .font(.headline)
                                Text("GEL\(String(format: "%.2f", product.productPrice))")
                                    .foregroundColor(.gray)
                                Text("Available: \(product.stockQuantity)")
                                    .foregroundColor(.gray)
                                
                            }
                            Spacer()
                            
                            HStack {
                                Button("-") {
                                    viewModel.decreaseQuantity(for: index)
                                }
                                .foregroundColor(.white)
                                .background(Color.cyan)
                                .cornerRadius(8)
                                .buttonStyle(BorderedButtonStyle())
                                
                                Text("\(product.quantity)")
                                    .padding(.horizontal, 10)
                                
                                Button("+") {
                                    viewModel.increaseQuantity(for: index)
                                }
                                .foregroundColor(.white)
                                .background(Color.cyan)
                                .cornerRadius(8)
                                .buttonStyle(BorderedButtonStyle())
                            }
                        }
                    }
                    .onDelete { indices in
                        indices.forEach { index in
                            viewModel.removeProduct(at: index)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.removeAllProducts()
                    }) {
                        Text("Remove All")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .padding(.bottom)
                    Spacer()
                }
                
                HStack {
                    Text("All Products: \(viewModel.totalQuantity())")
                    Spacer()
                    Text("Total Price: GEL\(String(format: "%.2f", viewModel.totalPrice()))")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
            }
            .navigationTitle("Groceries")
        }
    }
}




#Preview {
    ContentView()
}
