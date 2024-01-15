//
//  EndPointNews.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import Foundation


protocol ApiBuilder {
    var urlRequest : URLRequest {get}
    var baseUrl : URL {get}
    var path : String {get}
}


enum NewsApi {
case getNews
}


extension NewsApi : ApiBuilder {
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    
    
}

