//
//  Date + Extension.swift
//  doctorsTest
//
//  Created by Сергей on 21.08.2024.
//

import Foundation

extension Date {
    static func getYearsFromUnix(startDate: TimeInterval, endDate: TimeInterval) -> Int {
        var exp = 0
        let startDateTime = Date(timeIntervalSince1970: Double(startDate))
        let endInterval = Date(timeIntervalSince1970: endDate)
        let interval = endInterval.timeIntervalSince(startDateTime)
        let days = Int(interval / (60 * 60 * 24))
        let years = days / 365
        if years < 0 {
            exp = 0
        } else {
            exp = years
        }
        
        return exp
    }
}
