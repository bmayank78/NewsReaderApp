//
//  NewsCellView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct NewsCellView : View {

    var newsItem: NewsModelDTO
    @State private var isBookmarked = false
    
    init(newsItem: NewsModelDTO) {
        self.newsItem = newsItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    isBookmarked.toggle()
                }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                }
                PillTextView(text: newsItem.category?.capitalized ?? StringConstants.defaultString)
            }
            Text(newsItem.title ?? StringConstants.defaultString)
                .font(.headline)
                .lineLimit(2)
            Text(newsItem.summary ?? StringConstants.defaultString)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
    }
}
