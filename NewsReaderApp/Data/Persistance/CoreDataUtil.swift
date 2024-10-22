//
//  CoreDataUtil.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData

final class CoreDataUtil: StorageProtocol {
    static var managedObjectContext: NSManagedObjectContext = {
        return CoreDataStack.shared.context
    }()
}
