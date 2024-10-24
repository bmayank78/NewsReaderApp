//
//  FetchNewsUseCase.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

class FetchNewsUseCase {
    private let repository: FetchNewsRepository
    
    init(dependencies: HomeDependencies) {
        self.repository = dependencies.resolveFetchNewsRepository()
    }
    
    func fetchNews() async -> Future<[NewsModel]?, NErrors> {
        return await repository.fetchNews()
    }
}
