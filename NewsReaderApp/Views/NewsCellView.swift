//
//  NewsCellView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct NewsCellView : View {

    @State var newsItem: NewsModelDTO
    var onTappedBookmark: (_ isBookmarked: Bool) -> Void = { _ in}
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    newsItem.isBookmarked?.toggle()
                    self.onTappedBookmark(newsItem.isBookmarked ?? false)
                }) {
                    Image(systemName: newsItem.isBookmarked ?? false ? "bookmark.fill" : "bookmark")
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
