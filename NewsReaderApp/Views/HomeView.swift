//
//  HomeView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var fetchNewsViewModel: FetchNewsViewModel
    private var addBookmarkViewModel: AddBookmarkViewModel
    private var deleteBookmarkViewModel: DeleteBookmarkViewModel
    @State private var selectedCategory: String = StringConstants.HomeViewConstants.defaultCategory
    
    init(dependencies: DefaultNewsAppDependencies) {
        self.fetchNewsViewModel = dependencies.resolveFetchNewsViewModel()
        self.addBookmarkViewModel = dependencies.resolveAddBookmarksViewModel()
        self.deleteBookmarkViewModel = dependencies.resolveDeleteBookmarksViewModel()
        self.fetchNewsViewModel.fetchNews()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchNewsViewModel.filteredNewsResults) { news in
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
            .navigationBarTitle(Text(StringConstants.HomeViewConstants.screenTitle))
            .navigationBarItems(leading: Button(action: {
            }) {
                if !fetchNewsViewModel.isLoading {
                    // display category selection list
                    PopoverListView(menuItems: fetchNewsViewModel.allCategories, selectedCategory: $selectedCategory) {
                        fetchNewsViewModel.updateCategory(category: selectedCategory)
                    }
                }
            })
            .navigationBarItems(trailing: Button(action: {
            }) {
                if fetchNewsViewModel.isLoading {
                    // display loader on navigation bar
                    ActivityIndicatorView(style: .medium)
                } else {
                    // refresh button
                    Button(action: {
                        self.fetchNewsViewModel.fetchNews()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            })
        }
    }
}
