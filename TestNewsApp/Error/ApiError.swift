//
//  ApiError.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import Foundation


enum ApiError : Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension ApiError : LocalizedError {
    
    var errorDescription: String? {
        
        switch self {
        case .decodingError:
            return "failed to decode the object from service"
        case .errorCode(let code):
            return "\(code) - something went wrong"
        case .unknown:
            return "the error is unknown"
        }
        
        
        
    }
    
}
