//
//  RecipeList.swift
//  RecipeApp
//
//  Created by D'Ante Watson on 4/29/25.
//

import SwiftUI

struct RecipeList: View {
    @State private var selectedVideoURL: URL?
    
    @StateObject private var viewModel = RecipeListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if let error = viewModel.errorMessage {
                    Text(error)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeRow(recipe: recipe)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.fetchRecipes()
            }
            .refreshable {
                await viewModel.fetchRecipes()
            }
        }
    }
}

