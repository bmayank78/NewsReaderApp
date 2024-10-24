//
//  BookmarkView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct BookmarkView: View {
    
    @ObservedObject private var viewModel: FetchBookmarksViewModel
    private var addBookmarkViewModel: AddBookmarkViewModel
    private var deleteBookmarkViewModel: DeleteBookmarkViewModel
    
    init(dependencies: BookmarkDependencies) {
        self.viewModel = dependencies.resolveFetchBookmarksViewModel()
        self.addBookmarkViewModel = dependencies.appDependencies.resolveAddBookmarksViewModel()
        self.deleteBookmarkViewModel = dependencies.appDependencies.resolveDeleteBookmarksViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.bookmarkedNewsResults) { news in
                    NavigationLink(destination: self.viewModel.showDetailViewHandling(news: news)) {
                        NewsCellView(newsItem: news) { isBookmarked in
                            if isBookmarked {
                                self.addBookmarkViewModel.addBookmark(newsModelDTO: news)
                            } else {
                                self.deleteBookmarkViewModel.deleteBookmark(newsModelDTO: news)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle(Text(StringConstants.BookmarkViewConstants.screenTitle))
            .onAppear() {
                self.viewModel.fetchBookmarks()
            }
        }
    }
}
