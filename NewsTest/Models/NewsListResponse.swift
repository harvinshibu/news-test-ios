//
//  NewsListResponse.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import Foundation

struct NewsListResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Codable,Identifiable, Equatable {
    let source: SourceData?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var id: String = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    init(model: ArticleCDModel) {
        self.source = nil
        self.author = model.author
        self.title = model.title
        self.description = model.desc
        self.url = model.url
        self.urlToImage = model.urlToImage
        self.publishedAt = model.publishedAt
        self.content = model.content
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }
}

struct SourceData: Codable {
    let id: String?
    let name: String?
}
