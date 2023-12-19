//
//  TabView.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProductsViewModel
    
    var body: some View {
        TabView {
            ProductsPageView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Products")
                }
            CategoriesView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
        }
    }
}



#Preview {
    ContentView()
        .environmentObject(ProductsViewModel())
}
