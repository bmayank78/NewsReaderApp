//
//  HomeDependencies.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation

protocol HomeDependencies {
    var appDependencies: NewsAppDependencies { get }
    var homeCoordActions: HomeViewCoordinatorActions { get }
    func resolveFetchNewsViewModel() -> FetchNewsViewModel
    func resolveFetchNewsUseCase() -> FetchNewsUseCase
    func resolveFetchNewsRepository() -> FetchNewsRepository
}

class DefaultHomeDependencies: HomeDependencies {
    
    var appDependencies: NewsAppDependencies
    var homeCoordActions: HomeViewCoordinatorActions
    
    init(appDependencies: NewsAppDependencies, homeCoordActions: HomeViewCoordinatorActions) {
        self.appDependencies = appDependencies
        self.homeCoordActions = homeCoordActions
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
}
