//
//  NewsViewModel.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import Foundation
import Combine

protocol newsViewModel {
    func getArticle()
}

class newsViewModelImpl : ObservableObject , newsViewModel {
    
    private let  service : newsService
    private(set) var article = [Article]()
    private var cancable = Set<AnyCancellable>()
    @Published private(set) var status : newsStatus = .lodding
    
    init(service: newsService) {
        self.service = service
    }

    func getArticle() {
        self.status = .lodding
        let cancellable = service.request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.status = .success(content: self.article)
                case .failure(let error):
                    self.status = .failure(error: error)
                }
                
            } receiveValue: { response in
                self.article = response.articles
            }
            
        self.cancable.insert(cancellable)

    }
    
    
}
