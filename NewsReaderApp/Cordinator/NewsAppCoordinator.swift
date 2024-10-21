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
    // Define a property to track the selected tab
    @Published var selectedTab: NAppDependencies.Tab = .home
    var appDependencies: NAppDependencies
    
    init() {
        self.appDependencies = NAppDependencies()
    }
    
    func start() {
        // Initialization or further navigation can happen here
        self.selectedTab = self.appDependencies.getInitialTab()
    }
    
    // This can be used to manage the tab switch flows or deep linking in the future
    func goToTab(_ tab: NAppDependencies.Tab) {
        self.selectedTab = tab
    }
}
