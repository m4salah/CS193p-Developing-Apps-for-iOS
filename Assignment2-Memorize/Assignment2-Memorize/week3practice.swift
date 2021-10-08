//
//  week1App.swift
//  week1
//
//  Created by Mohamed Abdelkhalek Salah on 01/10/2021.
//

import SwiftUI

@main
struct Assignment1MemorizeApp: App {
    
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
