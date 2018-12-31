//
//  Int+Extension.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation

public extension Int {
    
    func days(from day: Day) -> [Day] {
        return array(from: day, advancing: self)
    }
    
    func months(from month: Month) -> [Month] {
        return array(from: month, advancing: self)
    }
    
    func years(from year: Year) -> [Year] {
        return array(from: year, advancing: self)
    }
    
    private func array<S: Strideable>(from source: S, advancing: Int) -> [S] where S.Stride == Int {
        guard advancing != 0 else {
            return []
        }
        if advancing > 0 {
            return (0..<advancing).map(source.advanced(by: ))
        } else {
            return ((advancing + 1)...0).map(source.advanced(by: ))
        }
    }
}
