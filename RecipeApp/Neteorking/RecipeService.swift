//
//  RecipeService.swift
//  RecipeApp
//
//  Created by D'Ante Watson on 4/29/25.
//

import Foundation

struct RecipeService {
    private let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!

    func fetchRecipes() async throws -> [Recipe] {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoded = try JSONDecoder().decode(RecipeResponse.self, from: data)
            return decoded.recipes
        } catch {
            throw URLError(.badServerResponse)
        }
    }
}
