//
//  Home.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//  Copyright © 2024 Nihar Satasia. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @AppStorage("darkMode") private var darkMode = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Image("Welcome")  
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 500, alignment: .center)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                    
                    Image("MealDB")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 500, alignment: .center)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                    
                    Text("Powered By")
                        .font(.system(size: 18, weight: .light, design: .serif))
                        .italic()
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    
                    Link(destination: URL(string: "https://themealdb.com/api.php")!) {
                        HStack {
                            Image(systemName: "globe")  // Replace with your own icon if available
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 37)
                                .background(darkMode ? Color.white : Color.white.opacity(0.0))
                            Text("TheMealDB API")
                                .font(.system(size: 18, weight: .light, design: .serif))
                        }
                        .padding()
                    }
                }   // End of VStack
            }   // End of ScrollView
        }   // End of ZStack
    }   // End of var
}

#Preview {
    Home()
}
