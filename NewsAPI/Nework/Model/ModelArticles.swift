//
//  ModelArticles.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import Foundation

struct ModelArticles : Codable {
    let status: String?
    let totalResults: Int?
    let articles: [ModelArticle]?
}


struct ModelArticle: Codable {
    let source: ModelSource?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    func getDate () -> String? {
        let formate = DateFormatter()
        formate.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = formate.date(from: publishedAt ?? "") else {
            return publishedAt
        }
        formate.dateFormat = "yyyy-MM-dd hh:mm a"
        return formate.string(from: date)
    }
    
}


struct ModelSource: Codable {
    let id: String?
    let name: String?
}
