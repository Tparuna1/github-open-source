//
//  CategoriesDetailView.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 19.12.23.
//

import SwiftUI


struct CategoriesDetailView: View {
    
    let category: Category
    
    @EnvironmentObject private var viewModel: ProductsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(category.name)
                .font(.headline)
                .padding(.top, 8)
                .foregroundColor(.primary)
        }
        .padding(8)
    }
}


#Preview {
    CategoriesDetailView(category: ProductsViewModel().categories.first ?? Category(name: "Default Category"))
        .environmentObject(ProductsViewModel())
}
