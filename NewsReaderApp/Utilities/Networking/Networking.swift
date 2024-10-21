//
//  Networking.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

protocol Networking {
    func request(endpoint: EndPoint, completion: @escaping (Data?, NErrors?) -> Void)
}

protocol Fetcher {
    func fetch<T>(endpoint: EndPoint, completion: @escaping (T?, NErrors?) -> Void) where T: Decodable
}
