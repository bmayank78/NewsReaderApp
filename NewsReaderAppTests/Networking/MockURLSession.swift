//
//  MockURLSession.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 24/10/24.
//

import Foundation

class MockURLSession: URLSession {
    var mockData: Data?
    var mockError: Error?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(mockData, nil, mockError)
        return URLSessionDataTask()
    }
}
