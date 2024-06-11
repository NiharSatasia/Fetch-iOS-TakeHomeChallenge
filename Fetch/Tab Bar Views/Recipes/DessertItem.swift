//
//  DessertItem.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//  Copyright © 2024 Nihar Satasia. All rights reserved.
//

import SwiftUI

struct DessertItem: View {
    let dessert: Dessert
    
    @State private var image: Image? = nil
    
    var body: some View {
        HStack {
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .onAppear {loadImage()}
            }
            
            VStack(alignment: .leading) {
                Text(dessert.strMeal)
                    .font(.headline)
            }
            .font(.system(size: 14))
        }
    }
    
    private func loadImage() {
        self.image = getImageFromUrl(url: dessert.strMealThumb, defaultFilename: "photo")
    }
}
