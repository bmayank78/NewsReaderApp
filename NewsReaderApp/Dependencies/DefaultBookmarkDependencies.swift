//
//  DefaultBookmarkDependencies.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 24/10/24.
//

import Foundation

protocol BookmarkDependencies {
    var appDependencies: NewsAppDependencies { get }
    var bookmarkCoordActions: BookmarkViewCoordinatorActions { get }
    func resolveFetchBookmarksViewModel() -> FetchBookmarksViewModel
}

final class DefaultBookmarkDependencies: BookmarkDependencies {
    
    var appDependencies: NewsAppDependencies
    var bookmarkCoordActions: BookmarkViewCoordinatorActions
    
    init(
        appDependencies: NewsAppDependencies,
        bookmarkCoordActions: BookmarkViewCoordinatorActions
    ) {
        self.appDependencies = appDependencies
        self.bookmarkCoordActions = bookmarkCoordActions
    }
    
    func resolveFetchBookmarksViewModel() -> FetchBookmarksViewModel {
        return FetchBookmarksViewModel(dependencies: self)
    }
}
