//
//  DeleteBookmarkViewModelTests.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import XCTest
@testable import NewsReaderApp

final class DeleteBookmarkViewModelTests: XCTestCase {

    private  let dependencies = MockNewsAppDependencies()
    private var addBookmarkUseCase: AddBookmarkUseCase?
    private var fetchBookmarkUseCase: FetchBookmarkUseCase?
    private var deleteBookmarkUseCase: DeleteBookmarkUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.addBookmarkUseCase = dependencies.resolveAddBookmarksUseCase()
        self.fetchBookmarkUseCase = dependencies.resolveFetchBookmarksUseCase()
        self.deleteBookmarkUseCase = dependencies.resolveDeleteBookmarksUseCase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.addBookmarkUseCase = nil
        self.fetchBookmarkUseCase = nil
        self.deleteBookmarkUseCase = nil
    }
    
    func testDeleteBookmark() {
        guard let newsModel = NewsReaderAppHelper.prepareNewsData() else {
            XCTFail("newsModel is nil")
            return
        }
        self.addBookmarkUseCase?.addEntity(news: newsModel)
        
        let fetchNews = self.fetchBookmarkUseCase?.fetchBookmarks()
        XCTAssertEqual(fetchNews?.count, 1)
        
        guard let fetchBookmarkedNews = fetchNews?.first else {
            XCTFail("fetchBookmarkedNews is nil")
            return
        }
        self.deleteBookmarkUseCase?.deleteBookmark(bookmark: fetchBookmarkedNews)
        XCTAssertEqual(fetchNews?.count, 1)
    }
}
