//
//  AccessibleNewsApp__Assignment_N41_TBCAcademyApp.swift
//  AccessibleNewsApp. Assignment N41 TBCAcademy
//
//  Created by tornike <parunashvili on 27.12.23.
//

import SwiftUI

@main
struct AccessibleNewsApp__Assignment_N41_TBCAcademyApp: App {
    
    @StateObject private var viewModel = NewsPageViewModel()
    
    var body: some Scene {
        WindowGroup {
            NewsPageView()
                .environmentObject(viewModel)
        }
    }
}
