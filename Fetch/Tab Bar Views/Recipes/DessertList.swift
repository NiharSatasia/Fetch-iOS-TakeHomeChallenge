//
//  DessertList.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//  Copyright © 2024 Nihar Satasia. All rights reserved.
//

import SwiftUI

struct DessertList: View {
    @State private var desserts: [Dessert] = []
    @State private var toBeDeleted: IndexSet?
    @State private var showConfirmation = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(desserts) { dessert in
                    NavigationLink(destination: DessertDetails(dessert: dessert)) {
                        DessertItem(dessert: dessert)
                            .alert(isPresented: $showConfirmation) {
                                Alert(title: Text("Delete Confirmation"),
                                      message: Text("Are you sure you want to permanently delete the dessert? It cannot be undone."),
                                      primaryButton: .destructive(Text("Delete")) {
                                        if let index = toBeDeleted?.first {
                                            desserts.remove(at: index)
                                        }
                                        toBeDeleted = nil
                                    }, secondaryButton: .cancel() {
                                        toBeDeleted = nil
                                    }
                                )
                            }
                    }
                }
                .onDelete(perform: delete)
            }
            .font(.system(size: 14))
            .navigationTitle("Desserts")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: fetchDesserts) {
                        Image(systemName: "arrow.counterclockwise")
                    }
                }
            }
        }
        .onAppear(perform: fetchDesserts)
    }
    
    private func delete(offsets: IndexSet) {
        toBeDeleted = offsets
        showConfirmation = true
    }
    
    private func fetchDesserts() {
        let apiUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        let apiHeaders = ["accept": "application/json"]
        
        if let data = getJsonDataFromApi(apiHeaders: apiHeaders, apiUrl: apiUrl, timeout: 10) {
            do {
                let dessertResponse = try JSONDecoder().decode(DessertResponse.self, from: data)
                self.desserts = dessertResponse.meals.sorted(by: { $0.strMeal < $1.strMeal })
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
