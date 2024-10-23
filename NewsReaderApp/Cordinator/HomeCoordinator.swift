//
//  HomeCoordinator.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation
import SwiftUI

class HomeCoordinator: Coordinator {
    
    private let appDependencies: NewsAppDependencies
    private lazy var homeDependencies: HomeDependencies = {
        DefaultHomeDependencies(
            appDependencies: self.appDependencies,
            homeCoordActions: self.getCoordActions()
        )
    }()
    private lazy var homeController: HomeView = {
        return HomeView(dependencies: self.homeDependencies)
    }()
    
    init(appDependencies: NewsAppDependencies) {
        self.appDependencies = appDependencies
    }
    
    private func getCoordActions() -> HomeViewCoordinatorActions {
        HomeViewCoordinatorActions(
            navigateToDetailScreen: self.navigateToDetailScreen
        )
    }
    
    func start() -> AnyView {
        return AnyView(self.homeController)
    }
    
    private func navigateToDetailScreen(news: NewsModelDTO) -> AnyView {
        return AnyView(DetailView(news: news))
    }
}

struct HomeViewCoordinatorActions {
    var navigateToDetailScreen: (NewsModelDTO) -> AnyView
}
