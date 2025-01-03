//
//  NewsReaderAppApp.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import SwiftUI

@main
struct NewsReaderApp: App {
    
    // @StateObject private var mainCoordinator = NewsAppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NewsAppCoordinator().start()
        }
    }
}
