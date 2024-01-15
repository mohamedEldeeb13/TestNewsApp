//
//  HomeView.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = newsViewModelImpl(service: newsServiceImpl())
    var body: some View {
        Group {
            
            switch viewModel.status {
            case .lodding:
                ProgressView()
            case .success(let article):
                NavigationView{
                    List(article , id : \.author) { item in
                        ArticleCardView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle("News")
                }
                
            case .failure(let error):
                Errorview(error: error, handler: viewModel.getArticle)
            }
            
        }
        .onAppear(perform: {
            viewModel.getArticle()
        })
    }
    
    func load(url : String?){
        guard let link = url , let url = URL(string: link) else { return }
        
        openUrl(url)
    }
}

#Preview {
    HomeView()
}
