//
//  Assignment_N37_StoreAppApp.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import SwiftUI

@main
struct Assignment_N37_StoreAppApp: App {
    
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}
