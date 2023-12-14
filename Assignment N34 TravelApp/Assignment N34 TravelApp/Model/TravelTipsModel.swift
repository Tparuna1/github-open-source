//
//  TravelTipsModel.swift
//  Assignment N34 TravelApp
//
//  Created by tornike <parunashvili on 14.12.23.
//

import SwiftUI

// MARK: - Tips Model

struct TravelAlerts {
    static let alerts = [
        Alert(title: Text("Travel Tip"), message: Text("Pack light and smart!"), dismissButton: .default(Text("Got it!"))),
        Alert(title: Text("Travel Tip"), message: Text("Learn a few basic phrases in the local language."), dismissButton: .default(Text("Got it!"))),
        Alert(title: Text("Travel Tip"), message: Text("Always have a backup plan."), dismissButton: .default(Text("Got it!"))),
        Alert(title: Text("Travel Tip"), message: Text("დაეტიე სადაც ხარ :) "), dismissButton: .default(Text("Got it!"))),
    ]
    
    static func randomAlert() -> Alert {
        let randomIndex = Int.random(in: 0..<alerts.count)
        return alerts[randomIndex]
    }
}
