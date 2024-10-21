//
//  NAppDependencies.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation


class NAppDependencies {
    
    // Define your tabs (enums can be used to represent tab items)
    enum Tab {
        case home
        case bookmark
    }
    
    func getInitialTab() -> Tab {
        // additional buisness logic
        // Initialization or further navigation can happen here
        return .home
    }
    
    func resolveNewsListViewModel() -> FetchNewsViewModel {
        return FetchNewsViewModel(dependencies: self)
    }
    
    func resolveFetchNewsUseCase() -> FetchNewsUseCase {
        return FetchNewsUseCase(dependencies: self, repository: self.resolveFetchNewsRepository())
    }
    
    func resolveFetchNewsRepository() -> FetchNewsRepository {
        return FetchNewsRepository(dependencies: self)
    }
    
    func resolveDataManager() -> DataManager {
        return DataManager(networking: HttpClient())
    }
}
