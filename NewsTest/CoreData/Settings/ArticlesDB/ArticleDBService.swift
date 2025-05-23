//
//  ArticleDBService.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import Foundation
import CoreData

@MainActor
struct ArticleDBService {
    static let shared = ArticleDBService()
    
    private let manager = CoreDataManager.shared
    
    func getAllArticles() -> [ArticleCDModel]? {
        guard let articles = CoreDataManager.getAllData(CDConstants.ENTITY_NAME.Article,
                                                               ctx: manager.context) as? [ArticleCDModel] else {
            return nil
        }
        
        return articles
    }

    
    func deleteArticlesData() {
        CoreDataManager.deleteAllData(CDConstants.ENTITY_NAME.Article, ctx: CoreDataManager.shared.context)
        CoreDataManager.save(CoreDataManager.shared.context)
    }
    
    func addArticlesToDB(articles: [Article]) {
        do {
            try manager.context.performAndWait {
                for article in articles {
                    let data = ArticleCDModel(context:  manager.context)
                    data.id = article.id
                    data.author = article.author
                    data.content = article.content
                    data.desc = article.description
                    data.publishedAt = article.publishedAt
                    data.title = article.title
                    data.url = article.url
                    data.urlToImage = article.urlToImage
                }
                try manager.context.save()
            }
        } catch {
            manager.context.rollback()
            print("Failed to save student data: \(error)")
        }
    }

    
    private init() {}
}
