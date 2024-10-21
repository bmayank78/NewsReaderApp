//
//  NewsListViewModel.swift
//  NewsReaderApp
//
//  Created by Mayank  Bajpai on 20/10/24.
//

import Foundation
import Combine

class FetchNewsViewModel: ObservableObject {
    let fetchNoticeUseCase: FetchNewsUseCase
    let dependencies: NAppDependencies
    @Published private var newsResults: [NewsModelDTO] = []
    @Published var filteredNewsResults: [NewsModelDTO] = []
    @Published var allCategories: [String] = []
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
        isLoading = true
        Task {
            await self.fetchNoticeUseCase.fetchNews().sink(receiveCompletion: {  completion in
                if case .failure(let appError) = completion {
                    print("error \(appError.localizedDescription)")
                }
                self.isLoading = false
            }, receiveValue: { newsList in
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.convertToDTOs(newsList: newsList)
                }
            }).store(in: &self.cancellable)
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
        newsResults = newsResultDTOs
        filterNews()
    }
    
    func filterNews() {
        if let category = selectedCategory, category != "All" {
            filteredNewsResults = newsResults.filter { $0.category?.caseInsensitiveCompare(category) == .orderedSame }
        } else {
            filteredNewsResults = newsResults
        }
    }
    
    func updateCategory(category: String) {
        selectedCategory = category
    }
}
