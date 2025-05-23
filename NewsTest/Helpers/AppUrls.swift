//
//  AppUrls.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

struct AppUrls {
    static let BASE_URL: String = "https://newsapi.org/"
    static let apiKey: String = "2398dd6a78f7454f87c532c8eb991fd4"
    
    public static func GET_NEWS_LIST(query: String, page: Int) -> String {
        return "v2/everything?q=\(query)&apiKey=\(apiKey)&page=\(page)"
    }
}
