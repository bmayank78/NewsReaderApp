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
    init(newsItem: NewsModelDTO) {
        self.newsItem = newsItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(newsItem.title ?? "")
                .font(.headline)
                .lineLimit(2)
            Text(newsItem.description ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
