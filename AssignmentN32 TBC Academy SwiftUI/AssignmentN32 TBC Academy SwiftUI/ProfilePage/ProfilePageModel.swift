//
//  ProfilePageModel.swift
//  AssignmentN32 TBC Academy SwiftUI
//
//  Created by tornike <parunashvili on 07.12.23.
//

import Foundation

struct UserProfile {
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var dateOfBirth = Date()
    var country: String = ""
    
    func formattedDateOfBirth() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: dateOfBirth)
    }
}
