//
//  Post.swift
//  ConcurrencyNetworkingExample
//
//  Created by Scott Gardner on 7/2/24.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
