//
//  ActivityViewController.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import SwiftUI
import WebKit

struct ActivityViewController : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        
        return UIActivityViewController(activityItems: [url], applicationActivities: [])
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {

    }
}
