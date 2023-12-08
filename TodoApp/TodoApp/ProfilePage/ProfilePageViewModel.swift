//
//  ProfilePageViewModel.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//


import SwiftUI



class ProfilePageViewModel: ObservableObject {
    
    @Published var userProfile = UserProfile()
    @Published var dateOfBirthString: String = ""
    
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    var name: String {
        get { userProfile.name }
        set { userProfile.name = newValue }
    }
    
    var email: String {
        get { userProfile.email }
        set { userProfile.email = newValue }
    }
    
    var formattedDateOfBirth: String {
        userProfile.formattedDateOfBirth()
    }
    
    var dateOfBirth: Date {
        get { userProfile.dateOfBirth }
        set {
            userProfile.dateOfBirth = newValue
            dateOfBirthString = formattedDateOfBirth
        }
    }
    
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
}
