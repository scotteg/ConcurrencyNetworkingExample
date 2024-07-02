//
//  DefaultURLProvider.swift
//  ConcurrencyNetworkingExample
//
//  Created by Scott Gardner on 7/2/24.
//

import Foundation

struct DefaultURLProvider: URLProvider {
    private let baseURL = "https://jsonplaceholder.typicode.com"

    func postURL() -> URL {
        URL(string: "\(baseURL)/posts")!
    }
    
    func userURL(userID: Int) -> URL {
        URL(string: "\(baseURL)/users/\(userID)")!
    }
    
    func imageURL(from urlString: String) -> URL {
        URL(string: urlString)!
    }
}
