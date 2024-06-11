//
//  FetchApp.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//

import SwiftUI
import SwiftData

@main
struct FetchApp: App {
    
    
    @AppStorage("darkMode") private var darkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
