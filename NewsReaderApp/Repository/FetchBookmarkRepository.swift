//
//  FetchBookmarkRepository.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData

class FetchBookmarkRepository {
    
    private let dependencies: NewsAppDependencies
    private let storage: StorageProtocol.Type
    
    init(dependencies: NewsAppDependencies) {
        self.dependencies = dependencies
        self.storage = dependencies.resolveStorage()
    }
    
    func fetchBookmarks() -> [BookmarkedNews] {
        var bookmarkedNews: [BookmarkedNews]  = []
        let fetchRequest: NSFetchRequest<BookmarkedNews> = BookmarkedNews.fetchRequest()
        do {
            bookmarkedNews = try self.storage.managedObjectContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch persons: \(error.localizedDescription)")
        }
        return bookmarkedNews
    }
}
