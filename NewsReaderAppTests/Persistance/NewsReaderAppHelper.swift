//
//  NewsReaderAppHelper.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation
import CoreData
@testable import NewsReaderApp

final class NewsReaderAppHelper {
    
    static func prepareNewsData() -> NewsModelDTO? {
        if let plistData = TestUtility.readDataFromPlist("NewsData") {
            return self.parseToNewsDTO(newsData: plistData)
        }
        return nil
    }
    
    static private func parseToNewsDTO(newsData: NSDictionary) -> NewsModelDTO {
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
    
    static func deleteAllEntities(entityName: String, context: NSManagedObjectContext) {
        // Create a fetch request for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        // Create a batch delete request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            // Perform the batch delete
            try context.execute(batchDeleteRequest)
            // Optionally, save the context if you want to persist changes
            try context.save()
            print("\(entityName) entities deleted successfully.")
        } catch {
            print("Failed to delete entities: \(error.localizedDescription)")
        }
    }
}
