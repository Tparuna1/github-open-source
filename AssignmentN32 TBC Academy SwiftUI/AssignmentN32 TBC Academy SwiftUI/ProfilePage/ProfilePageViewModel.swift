//
//  ProfilePageViewModel.swift
//  AssignmentN32 TBC Academy SwiftUI
//
//  Created by tornike <parunashvili on 07.12.23.
//

import Foundation
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
    
    var password: String {
        get { userProfile.password }
        set { userProfile.password = newValue }
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
    
    var country: String {
        get { userProfile.country }
        set { userProfile.country = newValue }
    }
    
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
}



//    @Published var name: String = ""
//    @Published var email: String = ""
//    @Published var password: String = ""
//    @Published var dateOfBirth = Date()
//    @Published var country: String = ""
