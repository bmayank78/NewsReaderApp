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
        return URLSessionDataTaskMock {
            completionHandler(self.mockData, nil, self.mockError)
        }
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
