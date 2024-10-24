//
//  PillTextView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 21/10/24.
//

import Foundation
import SwiftUI

struct PillTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .font(.system(size: 16, weight: .medium))
    }
}
