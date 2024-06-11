//
//  DessertDetails.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//  Copyright © 2024 Nihar Satasia. All rights reserved.
//

import SwiftUI

struct DessertDetails: View {
    let dessert: Dessert
    @State private var mealDetail: MealDetail?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let mealDetail = mealDetail {
                Form{
                    Section(header: Text("Dessert Name")) {
                        Text(mealDetail.strMeal)
                    }
                    Section(header: Text("Instructions")) {
                        Text(mealDetail.strInstructions)
                    }
                    Section(header: Text("Ingredients and Measurements")) {
                        Text(ingredientsText(mealDetail: mealDetail))
                    }
                }
                
            } else {
                Text("Loading...")
            }
        }
        .padding()
        .onAppear(perform: fetchMealDetails)
        .navigationTitle(dessert.strMeal)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func fetchMealDetails() {
        let apiUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessert.idMeal)"
        let apiHeaders = ["accept": "application/json"]
        
        if let data = getJsonDataFromApi(apiHeaders: apiHeaders, apiUrl: apiUrl, timeout: 10) {
            do {
                let mealDetailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
                self.mealDetail = mealDetailResponse.meals.first
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    private func ingredientsText(mealDetail: MealDetail) -> String {
        mealDetail.ingredients
            .map { "\($0.ingredient): \($0.measure)" }
            .joined(separator: "\n")
    }
}

