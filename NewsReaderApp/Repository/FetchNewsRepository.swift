//
//  NewsListRepository.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

class FetchNewsRepository {
    
    private let dependencies: DefaultNewsAppDependencies
    
    init(dependencies: DefaultNewsAppDependencies) {
        self.dependencies = dependencies
    }
    
    func fetchNews() async -> Future<[NewsModel]?, NErrors>  {
        let dataManager = self.dependencies.resolveDataManager()
        let fetchNewsRequest = FetchNewsService(dataManager: dataManager)
        return await fetchNewsRequest.fetchNews()
    }
}
