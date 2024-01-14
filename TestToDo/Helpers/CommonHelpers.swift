//
//  ExCalender.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-13.
//
import Foundation

class CommonHelpers {
    static let sharedInstance = CommonHelpers()
    
    private init() {}
    
    static func numberOfDaysBetween(_ from: Date, and to: Date) -> Int? {
        let calendar = Calendar.current
        guard let days = calendar.dateComponents(
            [.day], from: calendar.startOfDay(for: from),
            to: calendar.startOfDay(for: to)).day
        else {
            return nil
        }
        return days
    }
}
