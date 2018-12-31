//
//  Year.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation

public struct Year: Hashable, Codable, ReferenceDateStrideable {
    
    public var intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
    
    public init(date: Date = Date(), region: Region = .default) {
        self = region.year(for: date)
    }
}
