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
    
    // MARK: - Date
    
    func testStartDateOfDay() {
        XCTAssertEqual(region.startDate(of: day_2001_01_01_mon), startDate_2001_01_01)
    }
    
    func testStartDateOfMonth() {
        XCTAssertEqual(region.startDate(of: month_2001_01), startDate_2001_01_01)
    }
    
    func testStartDateOfYear() {
        XCTAssertEqual(region.startDate(of: year_2001), startDate_2001_01_01)
    }
    
    // MARK: - Day
    
    func testDayForDate() {
        XCTAssertEqual(region.day(for: startDate_2001_01_01), day_2001_01_01_mon)
    }
    
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
    
    func testMonthForDate() {
        XCTAssertEqual(region.month(for: startDate_2001_01_01), month_2001_01)
    }
    
    func testMonthForDay() {
        XCTAssertEqual(region.month(for: day_2001_01_01_mon), month_2001_01)
    }
    
    func testFirstMonthOfYear() {
        XCTAssertEqual(region.firstMonth(of: year_2001), month_2001_01)
    }
    
    // MARK: - Year
    
    func testYearForDate() {
        XCTAssertEqual(region.year(for: startDate_2001_01_01), year_2001)
    }
    
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
