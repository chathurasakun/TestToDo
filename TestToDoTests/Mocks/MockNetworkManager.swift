//
//  MockNetworkManager.swift
//  TestToDoTests
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//

import Foundation
@testable import TestToDo

class MockNetworkManager: ApiClient {
    
    func fetchSearchResults(searchText: String, completion: @escaping TestToDo.searchResultsHander) {
        let searchResult = [
            SearchResult(id: UUID(), itemName: "Soap", price: 120.00, thumbinail: "", discount: 4, validUntil: "2024-02-12"),
            SearchResult(id: UUID(), itemName: "Rice Packet 1kg", price: 350.00, thumbinail: "", discount: 5, validUntil: "2024-02-25"),
            SearchResult(id: UUID(), itemName: "Rice Packet 2kg", price: 500.00, thumbinail: "", discount: 5, validUntil: "2024-02-25"),
            SearchResult(id: UUID(), itemName: "Bananas 7", price: 130.00, thumbinail: "", discount: 0, validUntil: "2024-03-25"),
            SearchResult(id: UUID(), itemName: "Woman Sanitary Pad Set", price: 600.00, thumbinail: "", discount: 7, validUntil: "2024-03-25"),
            SearchResult(id: UUID(), itemName: "3 Apples Dubai", price: 200.00, thumbinail: "", discount: 5, validUntil: "2024-02-25"),
            SearchResult(id: UUID(), itemName: "Ice Cream Tub 1 ltr", price: 1350.00, thumbinail: "", discount: 5, validUntil: "2024-02-25"),
        ]
        completion("Success", 200, searchResult)
    }
    
    func fetchItemDetails(id: UUID, completion: @escaping TestToDo.itemDetailsHandler) {
        let itemDetails = ItemDetails(id: UUID(), actualDiscount: 7.5, isAvailable: true, availableCount: 200)
        completion("Success", 200, itemDetails)
    }
}
