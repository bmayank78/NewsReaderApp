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
    func resolveFetchBookmarksUseCase() -> FetchBookmarkUseCase
    func resolveFetchBookmarkRepository() -> FetchBookmarkRepository 
    func resolveAddBookmarksViewModel() -> AddBookmarkViewModel
    func resolveAddBookmarksUseCase() -> AddBookmarkUseCase
    func resolveDeleteBookmarksViewModel() -> DeleteBookmarkViewModel
    func resolveDeleteBookmarksUseCase() -> DeleteBookmarkUseCase
    func resolveDataManager() -> DataManager
    func getInitialTab() -> BottomTabBar
}

final class DefaultNewsAppDependencies:  NewsAppDependencies {
    
    func resolveDataManager() -> DataManager {
        return DataManager(networking: NetworkRequest())
    }
    
    func resolveStorage() -> StorageProtocol.Type {
        return CoreDataUtil.self
    }
    
    func resolveFetchBookmarksUseCase() -> FetchBookmarkUseCase {
        return FetchBookmarkUseCase(dependencies: self)
    }
    
    func resolveFetchBookmarkRepository() -> FetchBookmarkRepository {
        return FetchBookmarkRepository(dependencies: self)
    }
        
    func resolveAddBookmarksViewModel() -> AddBookmarkViewModel {
        return AddBookmarkViewModel(dependencies: self)
    }
    
    func resolveAddBookmarksUseCase() -> AddBookmarkUseCase {
        return AddBookmarkUseCase(dependencies: self)
    }
        
    func resolveDeleteBookmarksViewModel() -> DeleteBookmarkViewModel {
        return DeleteBookmarkViewModel(dependencies: self)
    }
    
    func resolveDeleteBookmarksUseCase() -> DeleteBookmarkUseCase {
        return DeleteBookmarkUseCase(dependencies: self)
    }
    
    func getInitialTab() -> BottomTabBar {
        // additional buisness logic
        // Initialization or further navigation can happen here
        return .home
    }
}
