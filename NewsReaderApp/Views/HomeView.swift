//
//  HomeView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel: FetchNewsViewModel
    @State private var selectedCategory: String = StringConstants.HomeViewConstants.defaultCategory
    
    init(dependencies: NAppDependencies) {
        self.viewModel = dependencies.resolveNewsListViewModel()
        self.viewModel.fetchNews()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredNewsResults) { news in
                    NavigationLink(destination: DetailView(news: news)) {
                        NewsCellView(newsItem: news)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle(Text(StringConstants.HomeViewConstants.screenTitle))
            .navigationBarItems(leading: Button(action: {
            }) {
                if !viewModel.isLoading {
                    PopoverListView(menuItems: viewModel.allCategories, selectedCategory: $selectedCategory) {
                        viewModel.updateCategory(category: selectedCategory)
                    }
                }
            })
            .navigationBarItems(trailing: Button(action: {
            }) {
                if viewModel.isLoading {
                    ActivityIndicatorView(style: .medium)
                } else {
                    Button(action: {
                        self.viewModel.fetchNews()
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
