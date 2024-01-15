//
//  newsService.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import Foundation
import Combine

protocol newsService {
    func request(from endPoint : NewsApi)->AnyPublisher<NewsResponse , ApiError>
}


struct newsServiceImpl : newsService {
    func request(from endPoint: NewsApi) -> AnyPublisher<NewsResponse, ApiError> {
       return URLSession
            .shared
            .dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in ApiError.unknown }
            .flatMap { data , response -> AnyPublisher<NewsResponse , ApiError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { error in
                            ApiError.decodingError
                            
                        }
                    
                        .eraseToAnyPublisher()
                }else {
                    return Fail(error: ApiError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    

}
