//
//  PopoverListView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 21/10/24.
//

import Foundation
import SwiftUI

struct PopoverListView: View {
    
    var menuItems: [String]
    @Binding var selectedCategory: String
    var onUpdate: () -> Void
    
    var body: some View {
        VStack {
            Menu("Choose Category: \(selectedCategory)") {
                ForEach(menuItems, id: \.self) { item in
                    Button(action: {
                        selectedCategory = item
                        onUpdate()
                    }) {
                        Text(item)
                    }
                }
            }
        }
    }
}
