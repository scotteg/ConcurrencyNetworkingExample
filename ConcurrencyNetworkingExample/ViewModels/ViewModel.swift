//
//  ViewModel.swift
//  ConcurrencyNetworkingExample
//
//  Created by Scott Gardner on 7/2/24.
//

import Foundation

@Observable
class ViewModel {
    var posts: [Post] = []
    var userImages: [Int: Data] = [:]
    
    private let dataService: DataService
    
    init(dataService: DataService = DataService()) {
        self.dataService = dataService
    }
    
    func fetchData() async {
        do {
            posts = try await dataService.fetchPosts()
            
            for post in posts {
                let user = try await dataService.fetchUser(withID: post.userId)
                
                if let imageURL = user.avatarURL {
                    let imageData = try await dataService.fetchImage(from: imageURL)
                    userImages[user.id] = imageData
                }
            }
        } catch {
            print("Error fetching data:", error.localizedDescription)
        }
    }
}
