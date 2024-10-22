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
    
    //MARK: - News List dependencies
    func resolveFetchNewsViewModel() -> FetchNewsViewModel {
        return FetchNewsViewModel(dependencies: self)
    }
    
    func resolveFetchNewsUseCase() -> FetchNewsUseCase {
        return FetchNewsUseCase(dependencies: self, repository: self.resolveFetchNewsRepository())
    }
    
    func resolveFetchNewsRepository() -> FetchNewsRepository {
        return FetchNewsRepository(dependencies: self)
    }
    
    //MARK: - Fetch bookmarks dependencies
    
    func resolveFetchBookmarksViewModel() -> FetchBookmarksViewModel {
        return FetchBookmarksViewModel(dependencies: self)
    }
    
    func resolveFetchBookmarksUseCase() -> FetchBookmarkUseCase {
        return FetchBookmarkUseCase(dependencies: self, repository: self.resolveFetchBookmarkRepository())
    }
    
    func resolveFetchBookmarkRepository() -> FetchBookmarkRepository {
        return FetchBookmarkRepository(dependencies: self, storage: self.resolveStorage())
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
        return DataManager(networking: NetworkRequest())
    }
}
