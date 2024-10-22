//
//  BookmarkedNews+CoreDataProperties.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//
//

import Foundation
import CoreData


extension BookmarkedNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookmarkedNews> {
        return NSFetchRequest<BookmarkedNews>(entityName: "BookmarkedNews")
    }

    @NSManaged public var article_id: String?
    @NSManaged public var category: String?
    @NSManaged public var id: String?
    @NSManaged public var image_url: String?
    @NSManaged public var link: String?
    @NSManaged public var pubDate: String?
    @NSManaged public var summary: String?
    @NSManaged public var title: String?
    @NSManaged public var isBookmarked: Bool

}

extension BookmarkedNews : Identifiable {

}
