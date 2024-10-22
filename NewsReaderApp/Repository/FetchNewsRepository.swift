//
//  NewsListRepository.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

class FetchNewsRepository {
    
    private let dependencies: NewsAppDependencies
    
    init(dependencies: NewsAppDependencies) {
        self.dependencies = dependencies
    }
    
    func fetchNews() async -> Future<[NewsModel]?, NErrors>  {
        let dataManager = self.dependencies.resolveDataManager()
        let fetchNewsService = FetchNewsService(dataManager: dataManager)
        return await fetchNewsService.fetchNews()
    }
}
