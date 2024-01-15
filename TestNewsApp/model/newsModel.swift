//
//  newsModel.swift
//  TestNewsApp
//
//  Created by Mohamed Abd Elhakam on 15/01/2024.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
//    var id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let description: String?
    let image: String?
    let date: Date?
}


extension Article {
    static var dummyData : Article =
        .init( author: "Kim Hjelmgaard, Tom Vanden Brook",
              url: "https://www.usatoday.com/story/news/world/2024/01/12/yemen-houthi-airstrikes-us-uk/72199832007/",
              source: "USA Today",
              title: "US attacks Houthi rebels: In Yemen bombing, America and UK strike back - USA TODAY",
              description: "Angry over Israel's war in Gaza, Yemen-based Houthi rebels have been attacking ships in the Red Sea. After U.S. and British airstrikes, is a wider war now likely?",
              image: "https://www.usatoday.com/gcdn/authoring/authoring-images/2024/01/12/USAT/72200244007-ap-united-states-red-sea-houthis.jpg?crop=1057,594,x0,y0&width=1057&height=594&format=pjpg&auto=webp",
              date: Date())
    
    
}


