//
//  AddBookmarkUseCase.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation

final class AddBookmarkUseCase {
    
    private let dependencies: DefaultNewsAppDependencies
    private let storage: StorageProtocol.Type
    
    init(dependencies: DefaultNewsAppDependencies) {
        self.dependencies = dependencies
        self.storage = dependencies.resolveStorage()
    }
    
    func addEntity(news: NewsModelDTO) {
        let context = storage.managedObjectContext
        let bookmarkedNews = BookmarkedNews(context: context)
        bookmarkedNews.id = news.id
        bookmarkedNews.title = news.title
        bookmarkedNews.article_id = news.article_id
        bookmarkedNews.image_url = news.image_url
        bookmarkedNews.link = news.link
        bookmarkedNews.summary = news.summary
        bookmarkedNews.pubDate = news.pubDate
        bookmarkedNews.category = news.category
        
        // Save the context
        do {
            try context.save()
            print("Data saved successfully!")
        } catch {
            print("Failed to save data: \(error)")
        }
    }
}
