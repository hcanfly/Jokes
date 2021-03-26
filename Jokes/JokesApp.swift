//
//  JokesApp.swift
//  Jokes
//
//  Created by Gary Hanson on 3/8/21.
//

import SwiftUI

@main
struct JokesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
