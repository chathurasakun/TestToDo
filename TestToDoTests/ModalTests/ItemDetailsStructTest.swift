//
//  ItemDetailsStructTest.swift
//  TestToDoTests
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//

import XCTest
@testable import TestToDo

final class ItemDetailsStructTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_ItemDetailsWithId() {
        let itemDetails = ItemDetails(id: UUID())
        XCTAssertNotNil(itemDetails)
    }
    
    func test_ItemDetailsWithActualDiscount() {
        let itemDetails = ItemDetails(actualDiscount: 8.8)
        
        XCTAssertNotNil(itemDetails)
        XCTAssertNotNil(itemDetails.actualDiscount)
        XCTAssertEqual(itemDetails.actualDiscount, 8.8)
    }
    
    func test_ItemDetailsWithIsAvailable() {
        let itemDetails = ItemDetails(isAvailable: false)
        
        XCTAssertNotNil(itemDetails)
        XCTAssertNotNil(itemDetails.isAvailable)
        XCTAssertEqual(itemDetails.isAvailable, false)
    }
    
    func test_ItemDetailsWithAvailableCount() {
        let itemDetails = ItemDetails(availableCount: 10)
        
        XCTAssertNotNil(itemDetails)
        XCTAssertNotNil(itemDetails.availableCount)
        XCTAssertEqual(itemDetails.availableCount, 10)
    }
}
