//
//  DetialView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI
import WebKit

struct DetialView: View {
    
    var news: NewsModelDTO
    @State private var showSheet = false
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: news.link ?? "https://google.com")!))
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showSheet = true
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.blue)
                            .accessibility(label: Text("Share story"))
                    }.sheet(isPresented: $showSheet) {
                        ActivityViewController(url: URL(string: news.link ?? "https://google.com")!)
                    }
                }
        ).navigationBarTitle("", displayMode: .inline)
    }
}
