//
//  ExString.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//

import Foundation

extension String {

    static func getDateFromString(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: stringDate)!
    }
}
