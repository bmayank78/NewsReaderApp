//
//  EndPoint.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation

import UIKit

public enum EndPoint {
    case fetchNews
}

extension EndPoint {
    var url: String {
        var url = "https://newsdata.io/api/1/"
        switch self {
        case .fetchNews:
            url += "latest"
        }
        if httpMethod == .get {
            url = "\(url)?\(queryParameters)"
        }
        return url
    }
    
    var parameters: [String: Any] {
        // TODO: Need to place/store this key in secure place
        let params = ["apikey": "pub_56780876b65deaf263f203a0a0bf89c3310c3"]
        switch self {
        case .fetchNews:
            print("No additional parameters required")
        }
        return params
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .fetchNews:
            return .get
        }
    }
    
    var queryParameters: String {
        return parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
    }
}

enum HttpMethod: String {
    case get
    case post
}
