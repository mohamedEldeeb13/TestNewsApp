//
//  ArticleCardView.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import SwiftUI




struct ArticleCardView: View {
    var article : Article
    
    
    var body: some View {
        HStack
        {
            
            if let image = article.image, let url = URL(string: image){
                AsyncImage(url: url,
                           transaction: .init(animation: .bouncy(duration: 1))) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    case .failure(let error):
                          placeHolder()
                            .overlay {
                                Text(error.localizedDescription)
                                    .foregroundStyle(.blue)
                                    .bold()
                                    .lineLimit(1)
                            }
                          
                        
                    @unknown default:
                        EmptyView()
                    }
                    
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
                
                
                
//                AsyncImage(url: url) { image in
//                    image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 100, height: 100)
//                .cornerRadius(10)
//                
            

            } else {
              placeHolder()
            }
            
            VStack(alignment: .leading, spacing: 4)
            {
                Text(article.title ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 17 , weight: .semibold))
                Text(article.description ?? "")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }//: Vstack
            
            
        }//: Hstack
    }
}

#Preview {
    ArticleCardView(article: Article.dummyData)
}

struct placeHolder: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .foregroundColor(.white)
            .background(.gray)
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}
