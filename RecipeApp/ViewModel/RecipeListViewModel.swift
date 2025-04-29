//
//  RecipeListViewModel.swift
//  RecipeApp
//
//  Created by D'Ante Watson on 4/29/25.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = RecipeService()

    func fetchRecipes() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            recipes = try await service.fetchRecipes()
            if recipes.isEmpty {
                errorMessage = "No recipes available."
            } else {
                errorMessage = nil
            }
        } catch {
            recipes = []
            errorMessage = "Failed to load recipes."
        }
    }
}
