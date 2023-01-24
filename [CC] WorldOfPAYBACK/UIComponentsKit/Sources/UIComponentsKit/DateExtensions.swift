//
//  DateExtensions.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation

public extension Date {
    var displayFormat: String {
        self.formatted(
            .dateTime
                .year(.twoDigits)
                .month(.twoDigits)
                .day(.defaultDigits)
                .hour(.conversationalDefaultDigits(amPM: .wide))
                .minute(.twoDigits)
                .locale(.current)
        )
    }
}

public extension String {
    func formatAndConvertToDate() -> Date {
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: self) else { return Date() }
        return date
    }
}
