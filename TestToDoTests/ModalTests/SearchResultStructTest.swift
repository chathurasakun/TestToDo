//
//  SearchResultStructTest.swift
//  TestToDoTests
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//

import XCTest
@testable import TestToDo

final class SearchResultStructTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func test_SearchResultWithId() {
        let searchResult = SearchResult(id: UUID())
        
        XCTAssertNotNil(searchResult)
        XCTAssertNotNil(searchResult.id)
    }
    
    func test_SearchResultWithItemName() {
        let searchResult = SearchResult(itemName: "Samba Rice")
        
        XCTAssertNotNil(searchResult)
        XCTAssertNotNil(searchResult.itemName)
        XCTAssertEqual(searchResult.itemName, "Samba Rice")
    }
    
    func test_SearchResultWithPrice() {
        let searchResult = SearchResult(price: 100.00)
        
        XCTAssertNotNil(searchResult)
        XCTAssertNotNil(searchResult.price)
        XCTAssertEqual(searchResult.price, 100.00)
    }
    
    func test_SearchResultWithThumbinail() {
        let searchResult = SearchResult(thumbinail: "https://www.istockphoto.com/photo/petronas-towers-gm466842820-59952574?phrase=kuala+lumpur&searchscope=image%2Cfilm")
        
        XCTAssertNotNil(searchResult)
        XCTAssertNotNil(searchResult.thumbinail)
        XCTAssertEqual(searchResult.thumbinail, "https://www.istockphoto.com/photo/petronas-towers-gm466842820-59952574?phrase=kuala+lumpur&searchscope=image%2Cfilm")
    }
    
    func test_SearchResultWithDiscount() {
        let searchResult = SearchResult(discount: 5)
        
        XCTAssertNotNil(searchResult)
        XCTAssertNotNil(searchResult.discount)
        XCTAssertEqual(searchResult.discount, 5)
    }
    
    func test_SearchResultWithValidUntil() {
        let searchResult = SearchResult(validUntil: "2024-02-23")
        
        XCTAssertNotNil(searchResult)
        XCTAssertNotNil(searchResult.validUntil)
        XCTAssertEqual(searchResult.validUntil, "2024-02-23")
    }
}
