//
//  FetchBookmarkUseCase.swift
//  NewsReaderApp
//
//  Created by Mayank Bajpai on 22/10/24.
//

import Foundation

class FetchBookmarkUseCase {
    private let repository: FetchBookmarkRepository
    
    init(dependencies: NewsAppDependencies) {
        self.repository = dependencies.resolveFetchBookmarkRepository()
    }
    
    func fetchBookmarks() -> [BookmarkedNews] {
        return repository.fetchBookmarks()
    }
}
