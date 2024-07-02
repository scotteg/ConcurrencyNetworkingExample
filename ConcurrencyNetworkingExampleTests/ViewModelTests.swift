//
//  ViewModelTests.swift
//  ConcurrencyNetworkingExampleTests
//
//  Created by Scott Gardner on 7/2/24.
//

import XCTest
@testable import ConcurrencyNetworkingExample

final class ViewModelTests: XCTestCase {
    var viewModel: ViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let dataService = DataService(urlProvider: MockURLProvider())
        viewModel = ViewModel(dataService: dataService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        try super.tearDownWithError()
    }

    func testFetchData() async throws {
        await viewModel.fetchData()
        XCTAssertEqual(viewModel.posts.count, 2)
        XCTAssertEqual(viewModel.posts.first?.title, "Test Post 1")
        XCTAssertNotNil(viewModel.userImages[1])
    }
}
