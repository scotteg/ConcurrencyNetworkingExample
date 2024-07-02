//
//  MockURLProvider.swift
//  ConcurrencyNetworkingExampleTests
//
//  Created by Scott Gardner on 7/2/24.
//

import Foundation
@testable import ConcurrencyNetworkingExample

struct MockURLProvider: URLProvider {
    func postURL() -> URL {
        Bundle(for: DataServiceTests.self).url(forResource: "MockPosts", withExtension: "json")!
    }
    
    func userURL(userID: Int) -> URL {
        Bundle(for: DataServiceTests.self).url(forResource: "MockUser", withExtension: "json")!
    }
    
    func imageURL(from urlString: String) -> URL {
        Bundle(for: DataServiceTests.self).url(forResource: "MockImage", withExtension: "png")!
    }
}
