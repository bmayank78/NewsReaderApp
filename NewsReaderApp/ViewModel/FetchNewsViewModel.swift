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
    @Published var newsResults: [NewsModelDTO] = []
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
                    print(newsList?.count)
                    self.isLoading = false
                    self.convertToDTOs(newsList: newsList)
                }
            }).store(in: &self.cancellable)
        }
    }
    
    func convertToDTOs(newsList: [NewsModel]?) {
        var newsResultDTOs: [NewsModelDTO] = []
        for newsItem in newsList ?? [] {
            let newsModelDTO = NewsModelDTO(
                article_id: newsItem.article_id,
                title: newsItem.title,
                image_url: newsItem.image_url,
                link: newsItem.link,
                description: newsItem.description,
                pubDate: newsItem.pubDate,
                category: newsItem.category
            )
            newsResultDTOs.append(newsModelDTO)
        }
        newsResults = newsResultDTOs
    }
}
