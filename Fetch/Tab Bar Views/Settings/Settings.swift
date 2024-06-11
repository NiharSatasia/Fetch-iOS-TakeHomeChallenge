//
//  Settings.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//  Copyright © 2024 Nihar Satasia. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("darkMode") private var darkMode = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Dark Mode Setting")) {
                    Toggle("Dark Mode", isOn: $darkMode)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
