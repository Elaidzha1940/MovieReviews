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
    var body: some View {
        
        ZStack(alignment: .top) {
            LinearGradient(colors: [Color.white, Color.black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Image("seven")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 450)
                    .cornerRadius(25)
                
                Text("The Last Kingdom: Seven Kings Must Die")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                Text("British historical drama")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundStyle(.gray, .opacity(0.4))
            }
        }
    }
}

#Preview {
    ContentView()
}

