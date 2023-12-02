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
    
    @State var movies = [
        Movie(id: 0, name: "The Last Kingdom: Seven Kings Must Die", description: "British historical drama", poster: "seven", offset: 0),
        Movie(id: 1, name: "Luther", description: "The Fallen Sun, based on award-winning British TV Series", poster: "luther", offset: 0),
        Movie(id: 2, name: "Rustin", description: "American biographical drama", poster: "rustin", offset: 0),
        Movie(id: 3, name: "Kandahar", description: "CIA undercover officer", poster: "kandahar", offset: 0)
    ]
    
    @State var move = 0
    
    struct Movie: Identifiable {
        var id: Int
        var name: String
        var description: String
        var poster: String
        var offset: CGFloat
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            LinearGradient(colors: [Color.white, Color.black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ForEach(movies.reversed()) { movie in
                VStack(alignment: .center) {
                    Image(movie.poster)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: (UIScreen.main.bounds.width - 15) - 35,
                            height: (UIScreen.main.bounds.height / 2) - CGFloat(movie.id - move) * 75
                        )
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        .offset(x: movie.id - move <= 2 ? CGFloat(movie.id - move) * 20 : 60)
                        .padding()
                    
                    Text("Movie name: \(movie.name)")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    Text("Movie description: \(movie.description)")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.gray, .opacity(0.4))
                        .multilineTextAlignment(.center)

                }
                .offset(x: movie.offset)
                .gesture(DragGesture().onChanged { value in
                    withAnimation(.spring) {
                        if value.translation.width < 0 {
                            if -value.translation.width < 0 && movie.id != movies.last!.id {
                                movies[movie.id].offset = value.translation.width
                            } else {
                                if movie.id > 0 {
                                    movies[movie.id].offset = -((UIScreen.main.bounds.width - 15) + 35) + value.translation.width
                                }
                            }
                        }
                    }
                }.onEnded { value in
                    withAnimation(.easeIn) {
                        if value.translation.width < 0 {
                            if -value.translation.width > 180 && movie.id != movies.last!.id {
                                movies[movie.id].offset = -((UIScreen.main.bounds.width - 15) + 35)
                                move += 1
                            } else {
                                movies[movie.id].offset = 0
                            }
                        } else {
                            if movie.id > 0 {
                                movies[movie.id - 1].offset = -((UIScreen.main.bounds.width - 15) + 35) + value.translation.width
                                if value.translation.width > 180 {
                                    movies[movie.id - 1].offset = 0
                                    move -= 1
                                } else {
                                    movies[movie.id - 1].offset = -((UIScreen.main.bounds.width - 15) + 35)
                                }
                            }
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
