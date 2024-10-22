//
//  AddBookmarkViewModel.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData

class AddBookmarkViewModel {
    
    private let dependencies: DefaultNewsAppDependencies
    private let addBookmarkUseCase: AddBookmarkUseCase
    private let storage: StorageProtocol.Type
    
    init(dependencies: DefaultNewsAppDependencies) {
        self.dependencies = dependencies
        self.addBookmarkUseCase = dependencies.resolveAddBookmarksUseCase()
        self.storage = dependencies.resolveStorage()
    }
    
    func addBookmark(newsModelDTO: NewsModelDTO) {
        self.addBookmarkUseCase.addEntity(news: newsModelDTO)
    }
}
