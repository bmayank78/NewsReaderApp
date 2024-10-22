//
//  DeleteBookmarkViewModel.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation

class DeleteBookmarkViewModel {
    
    private let dependencies: NewsAppDependencies
    private let deleteBookmarkUseCase: DeleteBookmarkUseCase
    private let storage: StorageProtocol.Type
    
    init(dependencies: NewsAppDependencies) {
        self.dependencies = dependencies
        self.deleteBookmarkUseCase = dependencies.resolveDeleteBookmarksUseCase()
        self.storage = dependencies.resolveStorage()
    }
    
    func deleteBookmark(newsModelDTO: NewsModelDTO) {
        let fetchBookmarks = self.dependencies.resolveFetchBookmarksUseCase().fetchBookmarks()
        if let bookmarkedNews = fetchBookmarks.first(where: { $0.article_id == newsModelDTO.article_id }) {
            self.deleteBookmarkUseCase.deleteBookmark(bookmark: bookmarkedNews)
        }
    }
}