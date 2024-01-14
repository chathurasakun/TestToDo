//
//  DetailsViewModel.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

protocol DetailsViewModelProtocol {
    var totalSum: Double { get }
    var itemCount: Int { get set }
    var searchResult: SearchResult { get set }
    var numberOfDaysRemaining: String? { get }
//    var itemDetails: ItemDetails? { get set }
//    var actualPrize: Double? { get set }
    
    func getItemDetails(completion: @escaping itemDetailsHandler)
}

class DetailsViewModel: DetailsViewModelProtocol {
    lazy var numberOfDaysRemaining: String? = {
        guard let validUntil = searchResult.validUntil else {
            return nil
        }
        let validDate = String.getDateFromString(stringDate: validUntil)
        return String(CommonHelpers.numberOfDaysBetween(Date(), and: validDate)!)
    }()
    
    var networkManager: ApiClient
    var itemCount: Int = 0
    var searchResult: SearchResult
//    var itemDetails: ItemDetails?
//    var actualPrize: Double?
    
    var totalSum: Double {
        if let price = searchResult.price {
            return Double(itemCount) * price
        }
        return 0.0
    }
    
    init(networkManager: ApiClient, searchResult: SearchResult) {
        self.networkManager = networkManager
        self.searchResult = searchResult
    }
    
    func calculateActualPrize(completion: @escaping(Double) -> Void) {
        getItemDetails { (message, statuscode, itemdetails) in
            if let actualDiscount = itemdetails?.actualDiscount, let originalPrice = self.searchResult.price {
                let actualPrize = originalPrice * ((100 - actualDiscount) / 100)
                completion(actualPrize)
            }
        }
    }
    
    internal func getItemDetails(completion: @escaping itemDetailsHandler) {
        guard let id = searchResult.id else {
            return
        }
        networkManager.fetchItemDetails(id: id) { (message, statuscode, itemDetails) in
            if statuscode == 200 {
                if let itemDetails = itemDetails {
//                    self.itemDetails = itemDetails
                    completion("item details fetched successfully.", statuscode, itemDetails)
                }
                completion("item details nil", statuscode, nil)
            }
            completion("Unsuccessful", 400, nil)
        }
    }
}
