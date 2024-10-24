//
//  NewsAppCoordinator.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

protocol Coordinator {
    func start() -> AnyView
}

final class NewsAppCoordinator: Coordinator, ObservableObject {

    @Published var selectedTab: BottomTabBar
    
    private var appDependencies: DefaultNewsAppDependencies
    var homeCoordinator: HomeCoordinator
    var bookmarkCoordinator: BookmarkCoordinator
    
    init() {
        self.appDependencies = DefaultNewsAppDependencies()
        self.selectedTab = self.appDependencies.getInitialTab()
        self.homeCoordinator = HomeCoordinator(appDependencies: self.appDependencies)
        self.bookmarkCoordinator = BookmarkCoordinator(appDependencies: self.appDependencies)
    }
    
    func start() -> AnyView {
        return AnyView(MainView(coordinator: self))
    }
    
    // This can be used to manage the tab switch flows or deep linking in the future
    func goToTab(_ tab: BottomTabBar) {
        self.selectedTab = tab
    }
}
