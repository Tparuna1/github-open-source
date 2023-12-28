//
//  NewsPageViewModel.swift
//  AccessibleNewsApp. Assignment N41 TBCAcademy
//
//  Created by tornike <parunashvili on 27.12.23.
//

import Foundation
import NetworkService

class NewsPageViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    
    // MARK: - Fetch News
    
    func fetchTopNews() {
        let urlString = "https://api.thenewsapi.com/v1/news/top?api_token=0JvyL21JSuOwnh5YJQdJVHP7rl0Bsp5PUVnpaKEF&locale=us&limit=3"
        
        NetworkService.fetchData(from: urlString) { [weak self] (result: Result<NewsModel, Error>) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let newsModel):
                    self.articles = newsModel.data
                case .failure(let error):
                    print("Error fetching data:", error)
                }
            }
        }
    }
    init() {
        fetchTopNews()
    }
}

