//
//  NetworkManager.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//
import Foundation

typealias searchResultsHander = (_ message: String, _ statuscode: Int, _ results: [SearchResult]?) -> Void
typealias itemDetailsHandler = (_ message: String, _ statuscode: Int, _ result: ItemDetails?) -> Void
typealias viewControllerHandler = (_ success: Bool, _ message: String) -> Void

class NetworkManager: ApiClient {
    
    func fetchSearchResults(searchText: String, completion: @escaping searchResultsHander) {
        // Assume these results are fetch from a backend service. For now I use dummy data
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
    
    func fetchItemDetails(id: UUID, completion: @escaping itemDetailsHandler) {
        // Assume item details are getting from a backend service
        let itemDetails = ItemDetails(id: UUID(), actualDiscount: 7.5, isAvailable: true, availableCount: 200)
        completion("Success", 200, itemDetails)
    }
}
