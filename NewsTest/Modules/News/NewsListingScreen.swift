//
//  NewsListingScreen.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import SwiftUI

struct NewsListingScreen: View {
    @Environment(\.navigate) private var navigate
    @StateObject var viewmodel: NewsListingViewModel = NewsListingViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                CustomNavigationView(title: "News", leftButtonImage: "line.3.horizontal", onAction: { })
                
                if let articles = viewmodel.articles, !articles.isEmpty {
                    SearchBar(searchText: $viewmodel.searchField)
                    ScrollView{
                        NewsHeaderView(imageURL: articles.first?.urlToImage ?? "",
                                       title: articles.first?.title ?? "",
                                       date: articles.first?.publishedAt ?? "",
                                       onTap: {
                            navigate(.newsDetail(data: articles.first!))
                        })
                        
                        LazyVStack {
                            ForEach(articles.dropFirst()) { article in
                                NewsItemView(imageURL: article.urlToImage ?? "",
                                             title: article.title ?? "",
                                             date: article.publishedAt ?? "",
                                             onTap: {
                                    navigate(.newsDetail(data: article))
                                }
                                ).id(article.id)
                                
                                if article == articles.last, viewmodel.isOnline {
                                    if viewmodel.currentPage <= viewmodel.totalPages {
                                        ProgressView()
                                            .padding()
                                            .onAppear {
                                                viewmodel.fetchNews()
                                            }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if !viewmodel.isLoading {
                        Text(viewmodel.error ?? "No News Found.")
                            .center()
                    } else {
                        Spacer()
                    }
                }
            }
            .onAppear{
                guard viewmodel.articles?.isEmpty ?? true else {
                    return
                }
                
                viewmodel.fetchNews()
            }
        }
        .navigationBarHidden(true)
        .loading($viewmodel.isLoading)
    }
}

#Preview {
    NewsListingScreen()
}
