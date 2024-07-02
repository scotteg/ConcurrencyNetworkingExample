//
//  ContentView.swift
//  ConcurrencyNetworkingExample
//
//  Created by Scott Gardner on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                    
                    if let imageData = viewModel.userImages[post.userId],
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    } else {
                        ProgressView()
                            .frame(height: 100)
                    }
                }
                .padding()
            }
            .navigationTitle("Posts")
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
