//
//  Month.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation

public struct Month: Hashable, Codable, ReferenceDateStrideable {
    
    public let intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
    
    public init(date: Date = Date(), region: Region = .default) {
        self = region.month(for: date)
    }
}
