//
//  AddBookmarkViewModelTests.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import XCTest
@testable import NewsReaderApp

final class AddBookmarkViewModelTests: XCTestCase {

    private  let dependencies = MockNewsAppDependencies()
    private var addBookmarkUseCase: AddBookmarkUseCase?
    private var fetchBookmarkUseCase: FetchBookmarkUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        self.addBookmarkUseCase = dependencies.resolveAddBookmarksUseCase()
        self.fetchBookmarkUseCase = dependencies.resolveFetchBookmarksUseCase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        self.addBookmarkUseCase = nil
        self.fetchBookmarkUseCase = nil
        NewsReaderAppHelper.deleteAllEntities(entityName: "BookmarkedNews", context: dependencies.resolveStorage().managedObjectContext)
    }

    func testAddBookmark() {
        guard let newsModel = NewsReaderAppHelper.prepareNewsData() else {
            XCTFail("newsModel is nil")
            return
        }
        self.addBookmarkUseCase?.addEntity(news: newsModel)
        
        let fetchNews = self.fetchBookmarkUseCase?.fetchBookmarks()
        
        XCTAssertEqual(fetchNews?.count, 1)
    }
}
