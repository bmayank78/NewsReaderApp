//
//  MockNewsAppDependencies.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation
@testable import NewsReaderApp

final class MockNewsAppDependencies: NewsAppDependencies {
    
    func resolveStorage() -> StorageProtocol.Type {
        return MockCoreDataUtil.self
    }
    
    //MARK: - Fetch bookmarks dependencies
    
    func resolveFetchBookmarksUseCase() -> FetchBookmarkUseCase {
        return FetchBookmarkUseCase(dependencies: self)
    }
    
    func resolveFetchBookmarkRepository() -> FetchBookmarkRepository {
        return FetchBookmarkRepository(dependencies: self)
    }
    
    //MARK: - Add bookmarks dependencies
    
    func resolveAddBookmarksViewModel() -> AddBookmarkViewModel {
        return AddBookmarkViewModel(dependencies: self)
    }
    
    func resolveAddBookmarksUseCase() -> AddBookmarkUseCase {
        return AddBookmarkUseCase(dependencies: self)
    }
    
    //MARK: - Delete bookmarks dependencies
    
    func resolveDeleteBookmarksViewModel() -> DeleteBookmarkViewModel {
        return DeleteBookmarkViewModel(dependencies: self)
    }
    
    func resolveDeleteBookmarksUseCase() -> DeleteBookmarkUseCase {
        return DeleteBookmarkUseCase(dependencies: self)
    }
    
    func resolveDataManager() -> DataManager {
        return DataManager(networking: NetworkRequest(session: MockURLSession()))
    }
    
    func getInitialTab() -> BottomTabBar {
        .home
    }
}
