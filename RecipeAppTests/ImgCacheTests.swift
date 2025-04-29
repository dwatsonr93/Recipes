//
//  ImgCacheTests.swift
//  RecipeApp
//
//  Created by D'Ante Watson on 4/29/25.
//

import XCTest
@testable import RecipeApp

final class ImgCacheTests: XCTestCase {

    func testLoadImageFromInvalidURLReturnsNil() async {
        let invalidURL = URL(string: "https://example.com/invalidimage.jpg")!
        let image = await ImgCache.shared.loadImage(from: invalidURL)
        XCTAssertNil(image)
    }
}
