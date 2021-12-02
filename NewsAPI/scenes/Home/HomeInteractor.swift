//
//  HomeInteractor.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//VC


class HomeInteractor {
    
    func getNews (pageSize: Int , page : Int , query : String? , completion : @escaping CompletionHandler<ModelArticles>) {
        
        var data : [String : String] = [
            Constants.Parameters.apiKey : Constants.apiKey,
            Constants.Parameters.country : SharedData.instance.selectedCountry ?? "" ,
            Constants.Parameters.category : SharedData.instance.selectedCategory ?? "" ,
            Constants.Parameters.pageSize : "\(pageSize)" ,
            Constants.Parameters.page : "\(page)"
        ]
        
        if let q = query, q.count > 0 {
            data[Constants.Parameters.query] = q
            data[Constants.Parameters.sortBy] = Constants.publishedAt
        }
        
        ApiClient<ModelArticles>.performRequest(route: .getNews(data: data )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .error(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
