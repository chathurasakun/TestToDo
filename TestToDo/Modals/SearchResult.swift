//
//  SearchResult.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//
import Foundation

struct SearchResult: Codable {
    var id: UUID!
    var itemName: String?
    var price: Double?
    var thumbinail: String?
    var discount: Int?
    var validUntil: String?
}
