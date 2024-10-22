//
//  NetworkRequest.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation

protocol Networking {
    func request(endpoint: EndPoint, completion: @escaping (Data?, NErrors?) -> Void)
}

public struct NetworkRequest: Networking {
   
    public init() {}
    
    var sharedSession: URLSession { return URLSession.shared }
    
    func request(endpoint: EndPoint, completion: @escaping (Data?, NErrors?) -> Void) {
            guard let url = URL(string: endpoint.url) else {
                completion(nil, .unknownError)
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = endpoint.httpMethod.rawValue
            let dataTask = sharedSession.dataTask(with: request) { data, _, error in
                DispatchQueue.main.async {
                    guard error == nil else {
                        completion(nil, .unknownError)
                        return
                    }
                    guard let data = data else {
                        completion(nil, .unknownError)
                        return
                    }
                    // printJSON(from: data)
                    completion(data, nil)
                }
            }
            dataTask.resume()
    }
    
    
    func printJSON(from data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                print(json)
            } else {
                print("Failed to cast JSON as dictionary")
            }
        } catch {
            print("Error serializing JSON: \(error.localizedDescription)")
        }
    }
}
