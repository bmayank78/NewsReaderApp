//
//  FetchNewsService.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

public class FetchNewsService {
    private let dataManager: DataManager
    private var cancellable = Set<AnyCancellable>()
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchNews() async -> Future<[NewsModel]?, NErrors> {
        
        return Future { promise in
            //TODO: instead of passing end point we should pass url request (i.e. DataManagerInputRequestModel)
            self.dataManager.executeRequest(endpoint: .fetchNews) { (response: NewsData?, error) in
                guard error == nil else {
                    promise(.failure(.unknownError))
                    return
                }
                guard let response = response else {
                    promise(.failure(.unknownError))
                    return
                }
                promise(.success(response.results))
            }
        }
    }
}
