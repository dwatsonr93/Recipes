//
//  RecipeAppTests.swift
//  RecipeAppTests
//
//  Created by D'Ante Watson on 4/29/25.
//

import XCTest
@testable import RecipeApp

final class RecipeServiceTests: XCTestCase {

    func testFetchRecipesReturnsRecipes() async throws {
        let service = RecipeService()
        let recipes = try await service.fetchRecipes()
        
        XCTAssertFalse(recipes.isEmpty, "Recipes should not be empty.")
    }
}
