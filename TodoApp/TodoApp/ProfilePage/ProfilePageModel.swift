//
//  ProfilePageModel.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import Foundation

struct UserProfile {
    var name: String = ""
    var email: String = ""
    var dateOfBirth = Date()
    
    func formattedDateOfBirth() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: dateOfBirth)
    }
}
