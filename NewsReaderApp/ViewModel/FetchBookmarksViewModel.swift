//
//  FetchBookmarkViewModel.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData
import Combine

class FetchBookmarksViewModel: ObservableObject {
    let fetchBookmarkUseCase: FetchBookmarkUseCase
    let dependencies: NewsAppDependencies
    @Published var bookmarkedNewsResults: [NewsModelDTO] = []
    let persistenceController = CoreDataStack.shared
    
    init(dependencies: NewsAppDependencies) {
        self.dependencies = dependencies
        self.fetchBookmarkUseCase = dependencies.resolveFetchBookmarksUseCase()
    }
    
    func fetchBookmarks() {
        let bookmarks = self.fetchBookmarkUseCase.fetchBookmarks()
        self.convertToDTOs(bookmarkedNews: bookmarks)
    }
    
    func convertToDTOs(bookmarkedNews: [BookmarkedNews]?) {
        var bookmarkedNewsDTOs: [NewsModelDTO] = []
        let bookmarkedNews = dependencies.resolveFetchBookmarksUseCase().fetchBookmarks()
        for bookmarkedItem in bookmarkedNews {
            let isAlreadyBookmarked = bookmarkedNews.contains(where: {$0.article_id == bookmarkedItem.article_id })
            let newsModelDTO = NewsModelDTO(
                article_id: bookmarkedItem.article_id,
                title: bookmarkedItem.title,
                image_url: bookmarkedItem.image_url,
                link: bookmarkedItem.link,
                summary: bookmarkedItem.summary,
                pubDate: bookmarkedItem.pubDate,
                category: bookmarkedItem.category,
                isBookmarked: isAlreadyBookmarked
            )
            bookmarkedNewsDTOs.append(newsModelDTO)
        }
        bookmarkedNewsResults = bookmarkedNewsDTOs
    }
}
