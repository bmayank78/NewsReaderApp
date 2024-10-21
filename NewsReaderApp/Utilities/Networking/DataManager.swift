//
//  DataManager.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

class DataManager: Fetcher {
    
    private var networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func fetch<T>(endpoint: EndPoint, completion: @escaping (T?, NErrors?) -> Void) where T: Decodable {
        
        self.networking.request(endpoint: endpoint) { data, error in
            guard error == nil else {
                completion(nil, .unknownError)
                return
            }
            guard let data = data else {
                completion(nil, .unknownError)
                return
            }
            let decoder = JSONDecoder()
            guard let decodeResponse = try? decoder.decode(T.self, from: data) else {
                completion(nil, .unknownError)
                return
            }
            completion(decodeResponse, nil)
        }
    }
}
