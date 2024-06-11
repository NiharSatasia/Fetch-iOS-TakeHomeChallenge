//
//  ContentView.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            DessertList()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .onAppear {
           let tabBarAppearance = UITabBarAppearance()
           tabBarAppearance.configureWithOpaqueBackground()
           UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }

    }
}

#Preview {
    ContentView()
}
