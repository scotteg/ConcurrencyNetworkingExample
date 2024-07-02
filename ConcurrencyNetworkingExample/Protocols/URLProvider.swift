//
//  URLProvider.swift
//  ConcurrencyNetworkingExample
//
//  Created by Scott Gardner on 7/2/24.
//

import Foundation

protocol URLProvider {
    func postURL() -> URL
    func userURL(userID: Int) -> URL
    func imageURL(from urlString: String) -> URL
}
