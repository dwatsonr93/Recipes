//
//  RecipeRow.swift
//  RecipeApp
//
//  Created by D'Ante Watson on 4/29/25.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe
    @State private var image: UIImage?

    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                if recipe.youtubeURL != nil {
                    Button("Watch Video") {
                        if let youtubeURL = recipe.youtubeURL {
                            UIApplication.shared.open(youtubeURL)
                        }
                    }
                    .foregroundStyle(.tertiary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.footnote)
                    .padding(.top, 4)
                }
            }
        }
        .task {
            await loadImage()
        }
    }

    private func loadImage() async {
        if let url = recipe.photoURLSmall {
            image = await ImgCache.shared.loadImage(from: url)
        }
    }
}
