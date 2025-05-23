//
//  NewsListingViewModel.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import SwiftUI

final class NewsListingViewModel: ObservableObject {
    @Published var error: String? = nil
    @Published var isLoading = false
    @Published var dataFetched = false
    @Published var articles: [Article]? = nil
    @Published var totalPages = 5
    @Published var currentPage = 1
    @Published var isOnline = false
    @Published var searchField: String = ""

    private let usecase = NewsUsecase()

    init() {
        bindUsecase()
    }

    private func bindUsecase() {
        usecase.$error.assign(to: &self.$error)
        usecase.$isLoading.assign(to: &self.$isLoading)
        usecase.$articles.assign(to: &self.$articles)
        usecase.$totalPages.assign(to: &self.$totalPages)
        usecase.$currentPage.assign(to: &self.$currentPage)
    }

    func fetchNews() {
        ConnectionManager.shared.checkConnection { [weak self] isOnline in
            guard let self = self else { return }

            Task {
                if isOnline {
                    await MainActor.run {
                        self.isOnline = true
                    }
                     self.usecase.getNewsList(query: "bitcoin", page: 1)
                } else {
                    await MainActor.run {
                        self.isOnline = false
                        self.loadFromDBIfNeeded()
                    }
                }
            }
        }
    }

    @MainActor
    private func loadFromDBIfNeeded() {
        guard articles?.isEmpty ?? true else { return }

        let saved = ArticleDBService.shared.getAllArticles()
        if let data = saved {
            self.articles = data.map { Article(model: $0) }
        }
    }
}
