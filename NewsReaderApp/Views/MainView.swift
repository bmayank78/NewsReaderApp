//
//  ContentView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import SwiftUI

struct MainView: View {
    // Reference the coordinator as a state object
    // @StateObject var coordinator = NewsAppCoordinator()

    @ObservedObject var coordinator: NewsAppCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeView(dependencies: coordinator.appDependencies)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(NAppDependencies.Tab.home)

            BookMarkView()
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
                .tag(NAppDependencies.Tab.bookmark)
        }
    }
}
