//
//  MainPageModel.swift
//  TodoApp
//
//  Created by tornike <parunashvili on 08.12.23.
//

import Foundation


struct MainPageModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var completed: Bool = false
}
