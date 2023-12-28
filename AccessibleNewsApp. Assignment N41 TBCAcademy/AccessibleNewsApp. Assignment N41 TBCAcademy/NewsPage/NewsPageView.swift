//
//  NewsPageView.swift
//  AccessibleNewsApp. Assignment N41 TBCAcademy
//
//  Created by tornike <parunashvili on 27.12.23.
//

import SwiftUI

struct NewsPageView: View {
    @EnvironmentObject private var viewModel: NewsPageViewModel

    var body: some View {
        NavigationView {
            ArticleTableView(articles: viewModel.articles)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ArticleTableView: UIViewRepresentable {
    var articles: [Article]
    
    // MARK: - UIViewRepresentable methods
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.articles = articles
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(articles: articles)
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var articles: [Article]
        
        init(articles: [Article]) {
            self.articles = articles
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return articles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
            let article = articles[indexPath.row]
            cell.configure(with: article)
            return cell
        }
    }
}




#Preview {
    NewsPageView()
        .environmentObject(NewsPageViewModel())
}

