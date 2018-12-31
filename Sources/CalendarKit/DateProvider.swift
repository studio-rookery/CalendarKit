//
//  DateProvider.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation

public protocol DateProvider {
    
    var date: Date { get }
}

public struct CurrentDateProvider: DateProvider {
    
    public init() {
        
    }
    
    public var date: Date {
        return Date()
    }
}

public struct AnyDateProvider: DateProvider {
    
    public let date: Date
    
    public init(willReturn date: Date) {
        self.date = date
    }
}
