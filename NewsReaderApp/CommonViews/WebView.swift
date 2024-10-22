//
//  WebView.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
    let request: URLRequest
    @Binding var isLoading: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.navigationDelegate = context.coordinator
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // MARK: - WKNavigationDelegate Methods
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
            print("Navigation started.")
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            parent.isLoading = false
            print("Navigation finished ")
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            print("Navigation finished.")
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("WebView failed with error: \(error.localizedDescription)")
        }
    }
}
