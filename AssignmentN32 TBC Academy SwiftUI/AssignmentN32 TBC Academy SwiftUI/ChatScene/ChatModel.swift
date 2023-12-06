//
//  ChatModel.swift
//  AssignmentN32 TBC Academy SwiftUI
//
//  Created by tornike <parunashvili on 06.12.23.
//

import Foundation

struct ChatView: Identifiable {
    let id = UUID()
    let profileImageName: String
    let name: String
    let messageSnippet: String
    var isRemoved: Bool = false
}
