//
//  DayTests.swift
//  CalendarKitTests
//
//  Created by hirano masaki on 2019/01/01.
//

import XCTest
@testable import CalendarKit

final class DayTests: XCTestCase {
    
    func testStride() {
        let x = Day(intervalSinceReferenceDate: 5)
        let y = Day(intervalSinceReferenceDate: 10)
        
        let n = x.distance(to: y)
        XCTAssertEqual(n, 5)
        XCTAssertEqual(x.advanced(by: n), y)
    }
    
    func testNext() {
        XCTAssertEqual(Day(intervalSinceReferenceDate: 0).next, Day(intervalSinceReferenceDate: 1))
    }
    
    func testPrevious() {
        XCTAssertEqual(Day(intervalSinceReferenceDate: 0).previous, Day(intervalSinceReferenceDate: -1))
    }
}
