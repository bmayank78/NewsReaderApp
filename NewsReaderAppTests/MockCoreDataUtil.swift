//
//  MockCoreDataUtil.swift
//  NewsReaderAppTests
//
//  Created by Mayank  Bajpai on 23/10/24.
//

import Foundation
import CoreData
@testable import NewsReaderApp

final class MockCoreDataUtil: StorageProtocol {
    
    static var managedObjectContext: NSManagedObjectContext = {
        return MockCoreDataStack.shared.context
    }()
}
