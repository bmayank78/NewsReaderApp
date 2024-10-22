//
//  NewsAppDependencies.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation

// Define your tabs (enums can be used to represent tab items)
enum BottomTabBar {
    case home
    case bookmark
}

protocol NewsAppDependencies {
    func resolveStorage() -> StorageProtocol.Type
    func resolveFetchNewsViewModel() -> FetchNewsViewModel
    func resolveFetchNewsUseCase() -> FetchNewsUseCase
    func resolveFetchNewsRepository() -> FetchNewsRepository
    func resolveFetchBookmarksViewModel() -> FetchBookmarksViewModel
    func resolveFetchBookmarksUseCase() -> FetchBookmarkUseCase
    func resolveFetchBookmarkRepository() -> FetchBookmarkRepository
    func resolveAddBookmarksViewModel() -> AddBookmarkViewModel
    func resolveAddBookmarksUseCase() -> AddBookmarkUseCase
    func resolveDeleteBookmarksViewModel() -> DeleteBookmarkViewModel
    func resolveDeleteBookmarksUseCase() -> DeleteBookmarkUseCase
    func resolveDataManager() -> DataManager
}

//TODO: Modulewise Manage dependencies
class DefaultNewsAppDependencies:  NewsAppDependencies {
    
    func getInitialTab() -> BottomTabBar {
        // additional buisness logic
        // Initialization or further navigation can happen here
        return .home
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
    
    //MARK: - Common dependencies
    
    func resolveDataManager() -> DataManager {
        return DataManager(networking: NetworkRequest())
    }
    
    func resolveStorage() -> StorageProtocol.Type {
        return CoreDataUtil.self
    }
}