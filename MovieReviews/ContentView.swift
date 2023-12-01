//  /*
//
//  Project: MovieReviews
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 30.11.2023
//
//  */

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MovieDBViewModel()
    var body: some View {
        
        VStack {
           
        }
        .padding()
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

class MovieDBViewModel: ObservableObject {
    @Published var homeScreen: [TrendingItem] = []
    
    func loadTrending() {
        
    }
}

struct TrendingItem: Identifiable, Decodable {
    let id: Int
    let adult: Bool
    let poster_path: String
    let title: String
    
}

#Preview {
    ContentView()
}
