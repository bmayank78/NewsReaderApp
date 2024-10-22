//
//  DetailView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI
import WebKit

struct DetailView: View {
    
    var news: NewsModelDTO
    @State private var showSheet = false
    @State var isLoading = false
    
    var body: some View {
        if let newsLink = news.link,  let newsLinkUrl = URL(string:  newsLink) {
            ZStack {
                WebView(request: URLRequest(url: newsLinkUrl), isLoading: $isLoading)
                if isLoading {
                    ActivityIndicatorView(style: .large)
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSheet = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                        .accessibility(label: Text("Share story"))
                }.sheet(isPresented: $showSheet) {
                    ActivityViewController(url: newsLinkUrl)
                }
            ).navigationBarTitle(news.title?.components(separatedBy: " ").first ?? StringConstants.defaultString, displayMode: .inline)
        }
    }
}
