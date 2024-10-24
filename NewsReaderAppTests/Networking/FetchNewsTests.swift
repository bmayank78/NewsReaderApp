//
//  FetchNewsTests.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 25/10/24.
//

import Foundation
@testable import NewsReaderApp
import XCTest

final class FetchNewsTests: XCTestCase {

    private var mockSession: MockURLSession?
    private var networking: NetworkRequest?
    
    override func setUpWithError() throws {
        // Setup code here. This method is called before the invocation of each test method in the class.
        self.mockSession = MockURLSession()
        self.networking = NetworkRequest(session: mockSession!)
    }

    override func tearDownWithError() throws {
        // Teardown code here. This method is called after the invocation of each test method in the class.
        self.mockSession = nil
        self.networking = nil
    }
    
    func testAPICallSuccess() throws {

        // Set up the mock response data
        let mockData = """
        {
            "key": "value"
        }
        """.data(using: .utf8)
        
        mockSession?.mockData = mockData
        
        let expectation = self.expectation(description: "API Call")
        
        networking?.request(endpoint: .fetchNews) { data, error in
            
            guard error == nil  else {
                XCTFail("Expected success but got failure with error \(String(describing: error))")
                return
            }
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testAPICallFailure() throws {
        
        mockSession?.mockError = NSError(domain: "com.test", code: 500, userInfo: nil)
        
        let expectation = self.expectation(description: "API Call Failure")
        
        networking?.request(endpoint: .fetchNews, completion: { data, error in
            guard error != nil  else {
                XCTFail("Expected failure but got success")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
}
