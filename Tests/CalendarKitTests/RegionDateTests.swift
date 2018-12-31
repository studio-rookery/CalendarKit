//
//  RegionDateTests.swift
//  CalendarKitTests
//
//  Created by hirano masaki on 2019/01/01.
//

import XCTest
@testable import CalendarKit

final class RegionDateTests: XCTestCase {
    
    func testDayForDate() {
        let testCases: [TestCase<Day>] = [
            .init(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .utc),
            .init(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .tokyo),
            .init(Date("2001/01/01 00:00"), is: Day("2000/12/31"), in: .honolulu),
            
            .init(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .utc),
            .init(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .tokyo),
            .init(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .honolulu),
            
            .init(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .utc),
            .init(Date("2000/12/31 15:00"), is: Day("2001/01/01"), in: .tokyo),
            .init(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .honolulu),
            
            .init(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .utc),
            .init(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .tokyo),
            .init(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .honolulu),
            
            .init(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .utc),
            .init(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .tokyo),
            .init(Date("2000/12/31 09:59"), is: Day("2000/12/30"), in: .honolulu),
        ]
        
        run(testCases) { region, date in
            region.day(for: date)
        }
    }
    
    func testDayForMonth() {
        let testCases: [TestCase<Month>] = [
            .init(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .utc),
            .init(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .tokyo),
            .init(Date("2001/01/01 00:00"), is: Month("2000/12"), in: .honolulu),
            
            .init(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .utc),
            .init(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .tokyo),
            .init(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .honolulu),
            
            .init(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .utc),
            .init(Date("2000/12/31 15:00"), is: Month("2001/01"), in: .tokyo),
            .init(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .honolulu),
            
            .init(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .utc),
            .init(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .tokyo),
            .init(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .honolulu),
            
            .init(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .utc),
            .init(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .tokyo),
            .init(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .honolulu),
        ]
        
        run(testCases) { region, date in
            region.month(for: date)
        }
    }
    
    func testDayForYear() {
        let testCases: [TestCase<Year>] = [
            .init(Date("2001/01/01 00:00"), is: Year("2001"), in: .utc),
            .init(Date("2001/01/01 00:00"), is: Year("2001"), in: .tokyo),
            .init(Date("2001/01/01 00:00"), is: Year("2000"), in: .honolulu),
            
            .init(Date("2000/12/31 14:59"), is: Year("2000"), in: .utc),
            .init(Date("2000/12/31 14:59"), is: Year("2000"), in: .tokyo),
            .init(Date("2000/12/31 14:59"), is: Year("2000"), in: .honolulu),
            
            .init(Date("2000/12/31 15:00"), is: Year("2000"), in: .utc),
            .init(Date("2000/12/31 15:00"), is: Year("2001"), in: .tokyo),
            .init(Date("2000/12/31 15:00"), is: Year("2000"), in: .honolulu),
            
            .init(Date("2000/12/31 10:00"), is: Year("2000"), in: .utc),
            .init(Date("2000/12/31 10:00"), is: Year("2000"), in: .tokyo),
            .init(Date("2000/12/31 10:00"), is: Year("2000"), in: .honolulu),
            
            .init(Date("2000/12/31 09:59"), is: Year("2000"), in: .utc),
            .init(Date("2000/12/31 09:59"), is: Year("2000"), in: .tokyo),
            .init(Date("2000/12/31 09:59"), is: Year("2000"), in: .honolulu),
        ]
        
        run(testCases) { region, date in
            region.year(for: date)
        }
    }
    
    // MARK: - Helper
    
    struct TestCase<Expected: Equatable> {
        
        let date: Date
        let expected: Expected
        let region: Region
        
        let file: StaticString
        let line: UInt
        
        init(_ date: Date, is expected: Expected, in region: Region, file: StaticString = #file, line: UInt = #line) {
            self.date = date
            self.expected = expected
            self.region = region
            self.file = file
            self.line = line
        }
    }
    
    func run<T>(_ testCases: [TestCase<T>], _ makeResult: (Region, Date) -> T) {
        testCases.forEach { testCase in
            let result = makeResult(testCase.region, testCase.date)
            let expected = testCase.expected
            XCTAssertEqual(result, expected, file: testCase.file, line: testCase.line)
        }
    }
}
