//
//  FetchBookmarkRepository.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData

class FetchBookmarkRepository {
    
    private let dependencies: DefaultNewsAppDependencies
    private let storage: StorageProtocol.Type
    
    init(dependencies: DefaultNewsAppDependencies, storage: StorageProtocol.Type) {
        self.dependencies = dependencies
        self.storage = storage
    }
    
    func fetchBookmarks() -> [BookmarkedNews] {
        var bookmarkedNews: [BookmarkedNews]  = []
        let fetchRequest: NSFetchRequest<BookmarkedNews> = BookmarkedNews.fetchRequest()
        do {
            bookmarkedNews = try self.storage.managedObjectContext.fetch(fetchRequest)
        } catch {
            // Handle the error
            print("Failed to fetch persons: \(error.localizedDescription)")
        }
        return bookmarkedNews
    }
}
