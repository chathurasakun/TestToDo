//
//  DetailsViewModelTests.swift
//  TestToDoTests
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//

import XCTest
@testable import TestToDo

final class DetailsViewModelTests: XCTestCase {
    
    var sut: DetailsViewModel!
    var searchResults: SearchResult!
    
    override func setUp() {
        super.setUp()
        
        let mockNetworkManager = MockNetworkManager()
        searchResults = SearchResult(id: UUID(), price: 100)
        sut = DetailsViewModel(networkManager: mockNetworkManager, searchResult: searchResults)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        searchResults = nil
    }
    
    func testfetchItemDetailsSuccess() {
        XCTAssertNotNil(searchResults.id)
        
        sut.networkManager.fetchItemDetails(id: searchResults.id) { (message, statuscode, itemDetails) in
            XCTAssertNotNil(itemDetails)
            XCTAssertEqual(statuscode, 200)
        }
    }
    
    func testcalculateActualPrize() {
        sut.networkManager.fetchItemDetails(id: searchResults.id) { (message, statuscode, itemDetails) in
            XCTAssertNotNil(itemDetails)
            XCTAssertNotNil(itemDetails?.actualDiscount)
            XCTAssertEqual(itemDetails?.actualDiscount, 7.5)
            
            let actualPrize = self.searchResults.price! * (100 - (itemDetails?.actualDiscount)!) / 100
            XCTAssertEqual(actualPrize, 92.5)
        }
    }
}


