//
//  Day.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation

public struct Day: Hashable, Codable, ReferenceDateStrideable {
    
    public var intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
    
    public init(date: Date = Date(), region: Region = .default) {
        self = region.day(for: date)
    }
}

public extension Day {
    
    var nextWeek: Day {
        return advanced(by: Weekday.allCases.count)
    }
    
    var lastWeek: Day {
        return advanced(by: -Weekday.allCases.count)
    }
}
