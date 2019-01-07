//
//  RegionTests.swift
//  CalendarKitTests
//
//  Created by hirano masaki on 2019/01/01.
//

import XCTest
@testable import CalendarKit

final class RegionTests: XCTestCase {
    
    let region: Region = {
        var region = Region.utc
        region.dateProvider = AnyDateProvider(willReturn: .referenceDate)
        return region
    }()
    
    let startDate_2001_01_01 = Date.referenceDate
    
    let day_2001_01_01_mon = Day(intervalSinceReferenceDate: 0)
    let day_2001_01_02_tue = Day(intervalSinceReferenceDate: 1)
    let day_2001_01_03_wed = Day(intervalSinceReferenceDate: 2)
    let day_2001_01_04_thu = Day(intervalSinceReferenceDate: 3)
    let day_2001_01_05_fri = Day(intervalSinceReferenceDate: 4)
    let day_2001_01_06_sat = Day(intervalSinceReferenceDate: 5)
    let day_2001_01_07_sun = Day(intervalSinceReferenceDate: 6)
    let day_2001_01_08_mon = Day(intervalSinceReferenceDate: 7)
    
    let month_2001_01 = Month(intervalSinceReferenceDate: 0)
    
    let year_2001 = Year(intervalSinceReferenceDate: 0)
    
    // MARK: - Day
    
    func testFirstDayOfMonth() {
        XCTAssertEqual(region.firstDay(of: month_2001_01), day_2001_01_01_mon)
    }
    
    func testFirstDayOfYear() {
        XCTAssertEqual(region.firstDay(of: year_2001), day_2001_01_01_mon)
    }
    
    func testIsFirstDayOfMonth() {
        XCTAssertTrue(region.isFirstDayOfMonth(day_2001_01_01_mon))
        XCTAssertFalse(region.isFirstDayOfMonth(day_2001_01_02_tue))
    }
    
    // MARK: - Month
    
    func testMonthForDay() {
        XCTAssertEqual(region.month(for: day_2001_01_01_mon), month_2001_01)
    }
    
    func testFirstMonthOfYear() {
        XCTAssertEqual(region.firstMonth(of: year_2001), month_2001_01)
    }
    
    // MARK: - Year
    
    func testYearForDay() {
        XCTAssertEqual(region.year(for: day_2001_01_01_mon), year_2001)
    }
    
    func testYearForMonth() {
        XCTAssertEqual(region.year(for: month_2001_01), year_2001)
    }
    
    // MARK: - Weekday
    
    func testWeekDayForDate() {
        XCTAssertEqual(region.weekday(for: startDate_2001_01_01), .monday)
    }
    
    func testWeekDayForDay() {
        XCTAssertEqual(region.weekday(for: day_2001_01_01_mon), .monday)
        XCTAssertEqual(region.weekday(for: day_2001_01_02_tue), .tuesday)
        XCTAssertEqual(region.weekday(for: day_2001_01_03_wed), .wednesday)
        XCTAssertEqual(region.weekday(for: day_2001_01_04_thu), .thursday)
        XCTAssertEqual(region.weekday(for: day_2001_01_05_fri), .friday)
        XCTAssertEqual(region.weekday(for: day_2001_01_06_sat), .saturday)
        XCTAssertEqual(region.weekday(for: day_2001_01_07_sun), .sunday)
    }
    
    func testNextWeekdayAfter() {
        XCTAssertEqual(region.next(.monday, after: day_2001_01_01_mon), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_02_tue), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_03_wed), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_04_thu), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_05_fri), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_06_sat), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_07_sun), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, after: day_2001_01_08_mon), day_2001_01_08_mon.nextWeek)
    }
    
    func testNextWeekdayOnOrAfter() {
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_01_mon), day_2001_01_01_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_02_tue), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_03_wed), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_04_thu), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_05_fri), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_06_sat), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_07_sun), day_2001_01_08_mon)
        XCTAssertEqual(region.next(.monday, onOrAfter: day_2001_01_08_mon), day_2001_01_08_mon)
    }
    
    func testPreviousWeekdayBefore() {
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_01_mon), day_2001_01_01_mon.lastWeek)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_02_tue), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_03_wed), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_04_thu), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_05_fri), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_06_sat), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_07_sun), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, before: day_2001_01_08_mon), day_2001_01_01_mon)
    }
    
    func testPreivousWeekdayOnOrBefore() {
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_01_mon), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_02_tue), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_03_wed), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_04_thu), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_05_fri), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_06_sat), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_07_sun), day_2001_01_01_mon)
        XCTAssertEqual(region.previous(.monday, onOrBefore: day_2001_01_08_mon), day_2001_01_08_mon)
    }
    
    // MARK: - Current
    
    func testToday() {
        XCTAssertEqual(region.today, day_2001_01_01_mon)
    }
    
    func testThisMonth() {
        XCTAssertEqual(region.thisMonth, month_2001_01)
    }
    
    func testThisYear() {
        XCTAssertEqual(region.thisYear, year_2001)
    }
}

extension RegionTests {
    
    func testStartDateOfDay() {
        
        let testCases: [TestCase<Day>] = [
            .startDate(of: Day("2001/01/01"), is: Date("2001/01/01 00:00"), in: .utc),
            .startDate(of: Day("2001/01/01"), is: Date("2000/12/31 15:00"), in: .tokyo),
            .startDate(of: Day("2001/01/01"), is: Date("2001/01/01 10:00"), in: .honolulu)
        ]
        
        run(testCases) { region, date, day in
            .assertEqual(region.startDate(of: day), date)
        }
    }
    
    func testStartDateOfMonth() {
        
        let testCases: [TestCase<Month>] = [
            .startDate(of: Month("2001/01"), is: Date("2001/01/01 00:00"), in: .utc),
            .startDate(of: Month("2001/01"), is: Date("2000/12/31 15:00"), in: .tokyo),
            .startDate(of: Month("2001/01"), is: Date("2001/01/01 10:00"), in: .honolulu)
        ]
        
        run(testCases) { region, date, month in
            .assertEqual(region.startDate(of: month), date)
        }
    }
    
    func testStartDateOfYear() {
        
        let testCases: [TestCase<Year>] = [
            .startDate(of: Year("2001"), is: Date("2001/01/01 00:00"), in: .utc),
            .startDate(of: Year("2001"), is: Date("2000/12/31 15:00"), in: .tokyo),
            .startDate(of: Year("2001"), is: Date("2001/01/01 10:00"), in: .honolulu)
        ]
        
        run(testCases) { region, date, year in
            .assertEqual(region.startDate(of: year), date)
        }
    }
    
    func testDayForDate() {
        let testCases: [TestCase<Day>] = [
            .date(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .utc),
            .date(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .tokyo),
            .date(Date("2001/01/01 00:00"), is: Day("2000/12/31"), in: .honolulu),
            
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .tokyo),
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .honolulu),
            
            .date(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 15:00"), is: Day("2001/01/01"), in: .tokyo),
            .date(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .honolulu),
            
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .tokyo),
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .honolulu),
            
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .tokyo),
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/30"), in: .honolulu)
        ]
        
        run(testCases) { region, date, day in
            .assertEqual(region.day(for: date), day)
        }
    }
    
    func testMonthForDate() {
        let testCases: [TestCase<Month>] = [
            .date(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .utc),
            .date(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .tokyo),
            .date(Date("2001/01/01 00:00"), is: Month("2000/12"), in: .honolulu),
            
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .tokyo),
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .honolulu),
            
            .date(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 15:00"), is: Month("2001/01"), in: .tokyo),
            .date(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .honolulu),
            
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .tokyo),
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .honolulu),
            
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .tokyo),
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .honolulu)
        ]
        
        run(testCases) { region, date, month in
            .assertEqual(region.month(for: date), month)
        }
    }
    
    func testYearForDate() {
        let testCases: [TestCase<Year>] = [
            .date(Date("2001/01/01 00:00"), is: Year("2001"), in: .utc),
            .date(Date("2001/01/01 00:00"), is: Year("2001"), in: .tokyo),
            .date(Date("2001/01/01 00:00"), is: Year("2000"), in: .honolulu),
            
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .tokyo),
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .honolulu),
            
            .date(Date("2000/12/31 15:00"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 15:00"), is: Year("2001"), in: .tokyo),
            .date(Date("2000/12/31 15:00"), is: Year("2000"), in: .honolulu),
            
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .tokyo),
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .honolulu),
            
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .tokyo),
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .honolulu)
        ]
        
        run(testCases) { region, date, year in
            .assertEqual(region.year(for: date), year)
        }
    }
    
    // MARK: - Helper
    
    struct TestCase<Value: Equatable> {
        
        let date: Date
        let value: Value
        let region: Region
        
        let file: StaticString
        let line: UInt
        
        static func date(_ date: Date, is value: Value, in region: Region, file: StaticString = #file, line: UInt = #line) -> TestCase<Value> {
            return TestCase(date: date, value: value, region: region, file: file, line: line)
        }
        
        static func startDate(of value: Value, is date: Date, in region: Region, file: StaticString = #file, line: UInt = #line) -> TestCase<Value> {
            return TestCase(date: date, value: value, region: region, file: file, line: line)
        }
    }
    
    struct Assert<Value: Equatable> {
        
        let result: Value
        
        let expected: Value
        
        static func assertEqual(_ result: Value, _ expected: Value) -> Assert<Value> {
            return Assert(result: result, expected: expected)
        }
    }
    
    func run<T, E>(_ testCases: [TestCase<T>], _ makeAssert: (Region, Date, T) -> Assert<E>) {
        testCases.forEach { testCase in
            let expectation = makeAssert(testCase.region, testCase.date, testCase.value)
            let result = expectation.result
            let expected = expectation.expected
            XCTAssertEqual(result, expected, file: testCase.file, line: testCase.line)
        }
    }
}
