//
//  StorageProtocol.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData

protocol StorageProtocol {
    static var managedObjectContext: NSManagedObjectContext { get set }
}
