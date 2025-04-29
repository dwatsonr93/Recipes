//
//  ImgCache.swift
//  RecipeApp
//
//  Created by D'Ante Watson on 4/29/25.
//

import UIKit

actor ImgCache {
    static let shared = ImgCache()
    
    private var memoryCache = NSCache<NSURL, UIImage>()
    private let fileManager = FileManager.default
    private let cacheDirectory: URL

    init() {
        cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }

    func loadImage(from url: URL) async -> UIImage? {
        if let cached = memoryCache.object(forKey: url as NSURL) {
            return cached
        }
        
        let fileName = url.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? UUID().uuidString
        let diskPath = cacheDirectory.appendingPathComponent(fileName)
        if let diskData = try? Data(contentsOf: diskPath),
           let diskImage = UIImage(data: diskData) {
            memoryCache.setObject(diskImage, forKey: url as NSURL)
            return diskImage
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let downloadedImage = UIImage(data: data) {
                memoryCache.setObject(downloadedImage, forKey: url as NSURL)
                try? data.write(to: diskPath)
                return downloadedImage
            }
        } catch {
            return nil
        }
        
        return nil
    }
}
