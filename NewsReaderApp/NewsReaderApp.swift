//
//  NewsReaderAppApp.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import SwiftUI

@main
struct NewsReaderApp: App {
    
    @StateObject var mainCoordinator = NewsAppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainView(coordinator: mainCoordinator)
                .onAppear {
                    mainCoordinator.start()
                }
        }
    }
}