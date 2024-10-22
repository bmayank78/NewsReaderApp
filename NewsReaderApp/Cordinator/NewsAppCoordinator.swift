//
//  NewsAppCoordinator.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

protocol Coordinator {
    func start()
}

class NewsAppCoordinator: Coordinator, ObservableObject {

    @Published var selectedTab: BottomTabBar = .home
    
    var appDependencies: DefaultNewsAppDependencies
    
    init() {
        self.appDependencies = DefaultNewsAppDependencies()
    }
    
    func start() {
        self.selectedTab = self.appDependencies.getInitialTab()
    }
    
    // This can be used to manage the tab switch flows or deep linking in the future
    func goToTab(_ tab: BottomTabBar) {
        self.selectedTab = tab
    }
}
