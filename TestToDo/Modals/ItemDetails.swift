//
//  ItemDetails.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//

import Foundation

struct ItemDetails: Codable {
    var id: UUID!
    var actualDiscount: Double?
    var isAvailable: Bool?
    var availableCount: Int?
}
