//
//  SearchControllerApiTests.swift
//  TestToDoTests
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import XCTest
@testable import TestToDo

final class SearchViewModelTests: XCTestCase {
    
    var sut: SearchViewModel!
    
    override func setUp() {
        super.setUp()
        
        let mockNetworkManager = MockNetworkManager()
        sut = SearchViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testSeachResultApiSuccess() {
        sut.networkManager.fetchSearchResults(searchText: "") { (message, statuscode, result) in
            XCTAssertEqual(statuscode, 200)
            XCTAssertNotNil(result)
        }
    }
}
