//
//  ChuckyJokesApp.swift
//  ChuckyJokes
//
//  Created by Haider Ali Kazal on 12/7/20.
//

import SwiftUI

@main
struct ChuckyJokesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
