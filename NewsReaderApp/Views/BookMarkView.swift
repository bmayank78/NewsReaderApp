//
//  BookMarkView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI

struct BookMarkView: View {
    @FetchRequest(
        entity: BookMarkedNews.entity(), sortDescriptors: []
        ) var items: FetchedResults<BookMarkedNews>

        var body: some View {
            List($items, id: \.self) { item in
                Text(item.attribute ?? "Unknown")
            }
            .onAppear {
                // Optionally load data or perform actions
            }
        }
}
