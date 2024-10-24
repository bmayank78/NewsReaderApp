//
//  MockNetworkRequest.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 24/10/24.
//

import Foundation
@testable import NewsReaderApp

struct MockNetworkRequest: Networking {
   
    var session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
        
    func request(endpoint: EndPoint, completion: @escaping (Data?, NErrors?) -> Void) {
            guard let url = URL(string: endpoint.url) else {
                completion(nil, .unknownError)
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = endpoint.httpMethod.rawValue
            let dataTask = session.dataTask(with: request) { data, _, error in
                DispatchQueue.main.async {
                    guard error == nil else {
                        completion(nil, .unknownError)
                        return
                    }
                    guard let data = data else {
                        completion(nil, .unknownError)
                        return
                    }
                    completion(data, nil)
                }
            }
            dataTask.resume()
    }
}
