//
//  CategoriesPageView.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import SwiftUI


struct CategoriesView: View {
    @EnvironmentObject var viewModel: ProductsViewModel
    
    var body: some View {
            NavigationView {
                List(viewModel.categories) { category in
                    NavigationLink(destination: CategoriesDetailView(category: category)) {
                        Text(category.name)
                    }
                }
                .navigationTitle("Categories")
                .padding(20)
                
                Text("\(viewModel.balance)")
            }

    }
}







#Preview {
    CategoriesView()
        .environmentObject(ProductsViewModel())
}



