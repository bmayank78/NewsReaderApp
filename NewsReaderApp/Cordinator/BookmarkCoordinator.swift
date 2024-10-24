//
//  BookmarkCoordinator.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 24/10/24.
//

import Foundation
import SwiftUI

final class BookmarkCoordinator: Coordinator {
    
    private let appDependencies: NewsAppDependencies
    private lazy var bookmarkDependencies: BookmarkDependencies = {
        DefaultBookmarkDependencies(
            appDependencies: self.appDependencies,
            bookmarkCoordActions: self.getCoordActions()
        )
    }()
    private lazy var bookmarkController: BookmarkView = {
        return BookmarkView(dependencies: self.bookmarkDependencies)
    }()
    
    init(appDependencies: NewsAppDependencies) {
        self.appDependencies = appDependencies
    }
    
    private func getCoordActions() -> BookmarkViewCoordinatorActions {
        BookmarkViewCoordinatorActions(
            navigateToDetailScreen: self.navigateToDetailScreen
        )
    }
    
    func start() -> AnyView {
        return AnyView(self.bookmarkController)
    }
    
    private func navigateToDetailScreen(news: NewsModelDTO) -> AnyView {
        //TODO: should use coordinator
        return AnyView(DetailView(news: news))
    }
}

struct BookmarkViewCoordinatorActions {
    var navigateToDetailScreen: (NewsModelDTO) -> AnyView
}
