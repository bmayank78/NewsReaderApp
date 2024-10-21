//
//  HomeView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: FetchNewsViewModel
    @State private var isPopoverVisible = false
    
    init(dependencies: NAppDependencies) {
        self.viewModel = dependencies.resolveNewsListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.newsResults) { news in
                    NavigationLink(destination: DetialView(news: news)) {
                        NewsCellView(newsItem: news)
                    }
                }
            }
            .navigationBarTitle(Text("News"))
            .navigationBarItems(leading: Button(action: {
                self.isPopoverVisible.toggle()
            }) {
                HStack {
                    Text("Categories")
                    Image(systemName: "ellipsis.circle")
                }
            })
            .navigationBarItems(trailing: Button(action: {
                
            }) {
                if viewModel.isLoading {
                    ActivityIndicatorView(style: .medium)
                }
            })
            .popover(isPresented: $isPopoverVisible) {
                PopoverListView()
                    .frame(width: 200, height: 300)
            }
            .onAppear() {
                // self.viewModel.fetchNews()
            }
        }
    }
}

struct PopoverListView: View {
    var body: some View {
        List {
            Text("Option 1")
            Text("Option 2")
            Text("Option 3")
        }
    }
}
