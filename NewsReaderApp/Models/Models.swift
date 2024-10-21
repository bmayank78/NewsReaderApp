//
//  Models.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation

struct NewsData: Decodable {
    let status: String
    let totalResults: Int
    let results: [NewsModel]
    let nextPage: String
}

struct NewsModel: Decodable {
    let article_id: String?
    let title: String?
    let image_url: String?
    let link: String?
    let description: String?
    let pubDate: String?
    let category: [String]?
}

struct NewsModelDTO: Decodable, Equatable, Identifiable {
    var id: String = UUID().uuidString
    let article_id: String?
    let title: String?
    let image_url: String?
    let link: String?
    let summary: String?
    let pubDate: String?
    let category: String?
}
