//
//  NewsUsecase.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import Foundation

final class NewsUsecase: ObservableObject {
    @Published var error: String? = nil
    @Published var isLoading: Bool = false
    @Published var articles: [Article]? = nil
    @Published var totalPages: Int = 5;
    @Published var currentPage: Int = 1;
    
    func getNewsList(query: String, page: Int) {
        Task { @MainActor in
            isLoading = currentPage == 1
            error = nil
        }
        let url = "\(AppUrls.BASE_URL)\(AppUrls.GET_NEWS_LIST(query: query, page: page))"
        
        APIManager.shared.get(urlString: url, responseType: NewsListResponse.self) { result in
            switch result {
            case .success(let data):
                Task.detached {
                    if self.currentPage == 1 {
                        let ctx = await CoreDataManager.shared.context
                        await CoreDataManager.deleteAllData(CDConstants.ENTITY_NAME.Article, ctx: ctx)
                    }
                    await ArticleDBService.shared.addArticlesToDB(articles: data.articles ?? [])
                }
                
                Task { @MainActor in
                    self.currentPage += 1
                    
                    if self.articles == nil {
                        self.articles = []
                    }
                    
                    self.articles?.append(contentsOf: data.articles ?? [])
                    self.isLoading = false
                }
            case .failure:
                Task { @MainActor in
                    self.error = "Failed to load data"
                    self.isLoading = false
                }
            }
        }
    }
}

