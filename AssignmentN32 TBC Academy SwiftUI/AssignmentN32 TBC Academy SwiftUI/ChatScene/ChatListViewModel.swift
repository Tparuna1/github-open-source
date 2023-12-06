//
//  ChatListViewModel.swift
//  AssignmentN32 TBC Academy SwiftUI
//
//  Created by tornike <parunashvili on 06.12.23.
//

import SwiftUI

class ChatListViewModel: ObservableObject {
    @Published var chatAccounts: [ChatView] = [
        ChatView(profileImageName: "Gela", name: "Gela", messageSnippet: "Dges mtsvadi shevcvat?"),
        ChatView(profileImageName: "Lela", name: "Lela", messageSnippet: "wamo barshi rame davlioT"),
        ChatView(profileImageName: "Bela", name: "Bela", messageSnippet: "amodi sagamos chemtan yavaze"),
        ChatView(profileImageName: "Malxazi", name: "Malxazi", messageSnippet: "Davliot?"),
        ChatView(profileImageName: "Gela", name: "Gela", messageSnippet: "Dges mtsvadi shevcvat?"),
        ChatView(profileImageName: "Lela", name: "Lela", messageSnippet: "wamo barshi rame davlioT"),
        ChatView(profileImageName: "Bela", name: "Bela", messageSnippet: "amodi sagamos chemtan yavaze"),
        ChatView(profileImageName: "Malxazi", name: "Malxazi", messageSnippet: "Davliot?"),
        ChatView(profileImageName: "Gela", name: "Gela", messageSnippet: "Dges mtsvadi shevcvat?"),
        ChatView(profileImageName: "Lela", name: "Lela", messageSnippet: "wamo barshi rame davlioT"),
        ChatView(profileImageName: "Bela", name: "Bela", messageSnippet: "amodi sagamos chemtan yavaze"),
        ChatView(profileImageName: "Malxazi", name: "Malxazi", messageSnippet: "Davliot?")
    ]
    
    @Published var isChatRemoved: Bool = false
    @Published var isDarkMode: Bool = false
    @Published var showAlert: Bool = false

    
    
    func toggleChatRemoval() {
        isChatRemoved.toggle()
        chatAccounts.indices.forEach { index in
            chatAccounts[index].isRemoved = isChatRemoved
        }
        if isChatRemoved {
            showAlert = true
        }
    }
    
    func switchColorScheme() {
        if isDarkMode {
            UserDefaults.standard.set(false, forKey: "isDarkMode")
        } else {
            UserDefaults.standard.set(true, forKey: "isDarkMode")
        }
        isDarkMode.toggle()
    }
}

