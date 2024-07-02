//
//  DataService.swift
//  ConcurrencyNetworkingExample
//
//  Created by Scott Gardner on 7/2/24.
//

import Foundation

actor DataService {
    private let urlProvider: URLProvider
    
    init(urlProvider: URLProvider = DefaultURLProvider()) {
        self.urlProvider = urlProvider
    }
    
    func fetchPosts() async throws -> [Post] {
        let url = urlProvider.postURL()
        let (data, _) = try await URLSession.shared.data(from: url)
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts
    }
    
    func fetchUser(withID userID: Int) async throws -> User {
        let url = urlProvider.userURL(userID: userID)
        let (data, _) = try await URLSession.shared.data(from: url)
        var user = try JSONDecoder().decode(User.self, from: data)
        user.avatarURL = "https://via.placeholder.com/150/\(userID)"
        return user
    }
    
    func fetchImage(from urlString: String) async throws -> Data {
        let url = urlProvider.imageURL(from: urlString)
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
