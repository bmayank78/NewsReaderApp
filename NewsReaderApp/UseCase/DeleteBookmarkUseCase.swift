//
//  DeleteBookmarkUseCase.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation

final class DeleteBookmarkUseCase {
    
    private let dependencies: DefaultNewsAppDependencies
    private let storage: StorageProtocol.Type
    
    init(dependencies: DefaultNewsAppDependencies) {
        self.dependencies = dependencies
        self.storage = dependencies.resolveStorage()
    }
    
    func deleteBookmark(bookmark: BookmarkedNews) {
        let context = storage.managedObjectContext
        // Save the context
        context.delete(bookmark)
    }
}
