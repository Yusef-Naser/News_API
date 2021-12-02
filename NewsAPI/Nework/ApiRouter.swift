//
//  ApiRouter.swift
//  NewsAPI
//
//  Created by Yusef Naser on 01/12/2021.
//

import Foundation


public protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

enum ApiRouter : URLRequestConvertible {
    
    case getNews (data : [String : String])
    
    private var Methods : String {
        switch self {
        case .getNews  :
            return "GET"
        }
    }
    
    private var Headers : [String : String] {
        switch self {
        case .getNews  :
            return [
                "Accept" : "application/json"
            ]
        }
    }
    
    private var Paths : String {
        switch self {
        case .getNews(let data ):
            let s = changeDictionaryToQueryURL(dic: data )
           return "/top-headlines?\(s)"
        }
    }
    
    func asURLRequest() -> URLRequest {
        let url = "\(Constants.BaseURL)\(Paths)"
        let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
        urlRequest.allHTTPHeaderFields = Headers
        return urlRequest
    }
    
    func changeDictionaryToQueryURL (dic : [String : String]) -> String {
        var stringArray : [String] = []
        
        dic.forEach { (item) in
            if !item.value.isEmpty {
                stringArray.append("\(item.key)=\(item.value)")
            }else {
                stringArray.append("\(item.key)")
            }
        }
        
        var str = ""
        
        stringArray.forEach { (s) in
            if str.isEmpty {
                str = s
            }else {
                str = str + "&" + s
            }
        }
        
        return str
    }
    
    
}
