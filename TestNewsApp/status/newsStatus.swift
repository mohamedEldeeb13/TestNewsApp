//
//  newsStatus.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import Foundation


enum newsStatus {
    case lodding
    case success(content : [Article])
    case failure(error : Error)
}
