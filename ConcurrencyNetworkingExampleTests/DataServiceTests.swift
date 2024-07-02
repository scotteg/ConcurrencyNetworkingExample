//
//  DataServiceTests.swift
//  ConcurrencyNetworkingExampleTests
//
//  Created by Scott Gardner on 7/2/24.
//

import XCTest
@testable import ConcurrencyNetworkingExample

final class DataServiceTests: XCTestCase {
    var dataService: DataService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        dataService = DataService(urlProvider: MockURLProvider())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataService = nil
        try super.tearDownWithError()
    }
    
    func testFetchPosts() async throws {
        let posts = try await dataService.fetchPosts()
        XCTAssertEqual(posts.count, 2)
        XCTAssertEqual(posts.first?.title, "Test Post 1")
    }
    
    func testFetchUser() async throws {
        let user = try await dataService.fetchUser(withID: 1)
        XCTAssertEqual(user.name, "Test User")
        XCTAssertNotNil(user.avatarURL)
    }
    
    func testFetchImage() async throws {
        let imageData = try await dataService.fetchImage(from: "")
        XCTAssertFalse(imageData.isEmpty)
    }
}
