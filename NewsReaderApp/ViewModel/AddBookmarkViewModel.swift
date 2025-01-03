//
//  AddBookmarkViewModel.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData

class AddBookmarkViewModel {
    
    private let dependencies: NewsAppDependencies
    private let addBookmarkUseCase: AddBookmarkUseCase
    
    init(dependencies: NewsAppDependencies) {
        self.dependencies = dependencies
        self.addBookmarkUseCase = dependencies.resolveAddBookmarksUseCase()
    }
    
    func addBookmark(newsModelDTO: NewsModelDTO) {
        self.addBookmarkUseCase.addEntity(news: newsModelDTO)
    }
}
