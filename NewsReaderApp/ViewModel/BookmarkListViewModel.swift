//
//  BookmarkListViewModel.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 22/10/24.
//

import Foundation
import CoreData
import Combine

class BookmarkListViewModel: ObservableObject {
    let fetchNoticeUseCase: FetchNewsUseCase
    let dependencies: NAppDependencies
    @Published private var bookmarkedNewsResults: [NewsModelDTO] = []
    @Published var filteredNewsResults: [NewsModelDTO] = []
    @Published var allCategories: [String] = []
    let persistenceController = CoreDataStack.shared
    
    private var selectedCategory: String? = nil {  // For dropdown selection
        didSet {
            self.filterNews()
        }
    }
    @Published private(set) var isLoading = false
    private var cancellable = Set<AnyCancellable>()
    
    init(dependencies: NAppDependencies) {
        self.dependencies = dependencies
        self.fetchNoticeUseCase = dependencies.resolveFetchNewsUseCase()
    }
    
    func fetchNews() {
        let request: NSFetchRequest<BookMarkedNews> = BookMarkedNews.fetchRequest()
        do {
            bookmarkedNewsResults = try persistenceController.persistentContainer.viewContext.fetch(request)
        } catch {
            print("Failed to fetch items: \(error)")
        }
    }
    
    func convertToDTOs(newsList: [NewsModel]?) {
        var newsResultDTOs: [NewsModelDTO] = []
        var categories: [String] = ["All"]
        for newsItem in newsList ?? [] {
            let newsModelDTO = NewsModelDTO(
                article_id: newsItem.article_id,
                title: newsItem.title,
                image_url: newsItem.image_url,
                link: newsItem.link,
                summary: newsItem.description,
                pubDate: newsItem.pubDate,
                category: newsItem.category?.first
            )
            newsResultDTOs.append(newsModelDTO)
            if let category = newsItem.category?.first, categories.contains(category) == false {
                categories.append(category)
            }
        }
        allCategories = categories
        bookmarkedNewsResults = newsResultDTOs
        filterNews()
    }
    
    func filterNews() {
        if let category = selectedCategory, category != "All" {
            filteredNewsResults = bookmarkedNewsResults.filter { $0.category?.caseInsensitiveCompare(category) == .orderedSame }
        } else {
            filteredNewsResults = bookmarkedNewsResults
        }
    }
    
    func updateCategory(category: String) {
        selectedCategory = category
    }
}
