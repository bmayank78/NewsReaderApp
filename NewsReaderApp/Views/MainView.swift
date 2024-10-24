//
//  ContentView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var coordinator: NewsAppCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            
            coordinator.homeCoordinator.start()
                .tabItem {
                    Label(StringConstants.MainViewConstants.bottomBarHomeTitle, systemImage: "house")
                }
                .tag(BottomTabBar.home)

            coordinator.bookmarkCoordinator.start()
                .tabItem {
                    Label(StringConstants.MainViewConstants.bottomBarBookMarkTitle, systemImage: "bookmark")
                }
                .tag(BottomTabBar.bookmark)
        }
    }
}
