//
//  FetchBookmarkUseCase.swift
//  NewsReaderApp
//
//  Created by Mayank Bajpai on 22/10/24.
//

import Foundation

class FetchBookmarkUseCase {
    private let repository: FetchBookmarkRepository
    
    init(dependencies: NewsAppDependencies, repository: FetchBookmarkRepository) {
        self.repository = repository
    }
    
    func fetchBookmarks() -> [BookmarkedNews] {
        return repository.fetchBookmarks()
    }
}
