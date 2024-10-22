//
//  BookMarkView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct BookMarkView: View {
    
    @ObservedObject private var viewModel: FetchBookmarksViewModel
    private var addBookmarkViewModel: AddBookmarkViewModel
    private var deleteBookmarkViewModel: DeleteBookmarkViewModel
    
    init(dependencies: DefaultNewsAppDependencies) {
        self.viewModel = dependencies.resolveFetchBookmarksViewModel()
        self.addBookmarkViewModel = dependencies.resolveAddBookmarksViewModel()
        self.deleteBookmarkViewModel = dependencies.resolveDeleteBookmarksViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.bookmarkedNewsResults) { news in
                    NavigationLink(destination: DetailView(news: news)) {
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
