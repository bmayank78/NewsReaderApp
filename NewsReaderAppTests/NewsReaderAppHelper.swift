//
//  NewsReaderAppHelper.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation
@testable import NewsReaderApp

final class NewsReaderAppHelper {
    
    static func prepareNewsData() -> NewsModelDTO? {
        if let plistData = TestUtility.readDataFromPlist("NewsData") {
            return self.parseToNewsDTO(newsData: plistData)
        }
        return nil
    }
    
    static func parseToNewsDTO(newsData: NSDictionary) -> NewsModelDTO {
        let newsModelDTO = NewsModelDTO(
            article_id: newsData["article_id"] as? String,
            title: newsData["title"] as? String,
            image_url: newsData["image_url"] as? String,
            link: newsData["link"] as? String,
            summary: newsData["summary"] as? String,
            pubDate: newsData["pubDate"] as? String,
            category: newsData["category"] as? String
        )
        return newsModelDTO
    }
}
