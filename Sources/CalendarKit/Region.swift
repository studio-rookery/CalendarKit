//
//  Region.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation

public struct Region {
    
    public var calendar: Calendar
    
    public var dateProvider: DateProvider
    
    public init(calendar: Calendar, dateProvider: DateProvider) {
        self.calendar = calendar
        self.dateProvider = dateProvider
    }
    
    static public let utc: Region = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        return Region(
            calendar: calendar,
            dateProvider: CurrentDateProvider()
        )
    }()
    
    static public var `default`: Region = {
        var region = Region.utc
        region.calendar.timeZone = .autoupdatingCurrent
        return region
    }()
}

private extension Region {
    
    func startDateComponents(_ component: Calendar.Component, for date: Date) -> DateComponents {
        let truncated = calendar.dateInterval(of: component, for: date)!.start + TimeInterval(calendar.timeZone.secondsFromGMT())
        return calendar.dateComponents([component], from: .referenceDate, to: truncated)
    }
}

// MARK: - Date

public extension Region {
    
    func startDate(of day: Day) -> Date {
        return calendar.date(byAdding: .day, value: day.intervalSinceReferenceDate, to: .referenceDate)!
    }
    
    func startDate(of month: Month) -> Date {
        return calendar.date(byAdding: .month, value: month.intervalSinceReferenceDate, to: .referenceDate)!
    }
    
    func startDate(of year: Year) -> Date {
        return calendar.date(byAdding: .year, value: year.intervalSinceReferenceDate, to: .referenceDate)!
    }
}

// MARK: - Day

public extension Region {
    
    func day(for date: Date) -> Day {
        let interval = startDateComponents(.day, for: date).day!
        return Day(intervalSinceReferenceDate: interval)
    }
    
    func firstDay(of month: Month) -> Day {
        return day(for: startDate(of: month))
    }
    
    func firstDay(of year: Year) -> Day {
        return day(for: startDate(of: year))
    }
    
    func isFirstDayOfMonth(_ day: Day) -> Bool {
        return firstDay(of: month(for: day)) == day
    }
}

// MARK: - Month

public extension Region {
    
    func month(for date: Date) -> Month {
        let interval = startDateComponents(.month, for: date).month!
        return Month(intervalSinceReferenceDate: interval)
    }
    
    func month(for day: Day) -> Month {
        return month(for: startDate(of: day))
    }
    
    func firstMonth(of year: Year) -> Month {
        return month(for: startDate(of: year))
    }
}

// MARK: - Year

public extension Region {
    
    func year(for date: Date) -> Year {
        let interval = startDateComponents(.year, for: date).year!
        return Year(intervalSinceReferenceDate: interval)
    }
    
    func year(for day: Day) -> Year {
        return year(for: startDate(of: day))
    }
    
    func year(for month: Month) -> Year {
        return year(for: startDate(of: month))
    }
}

// MARK: - WeekDay

public extension Region {
    
    func weekday(for date: Date) -> Weekday {
        let weekday = calendar.dateComponents([.weekday], from: date).weekday! - 1
        return Weekday(rawValue: weekday)
    }
    
    func weekday(for day: Day) -> Weekday {
        return weekday(for: startDate(of: day))
    }
    
    func previous(_ weekday: Weekday, before day: Day) -> Day {
        let weekdayOfDay = self.weekday(for: day)
        let distance = weekdayOfDay.distance(toPrevious: weekday)
        return day.advanced(by: distance)
    }
    
    func next(_ weekday: Weekday, after day: Day) -> Day {
        let weekdayOfDay = self.weekday(for: day)
        let distance = weekdayOfDay.distance(toNext: weekday)
        return day.advanced(by: distance)
    }
    
    func previous(_ weekday: Weekday, onOrBefore day: Day) -> Day {
        if self.weekday(for: day) == weekday {
            return day
        } else {
            return previous(weekday, before: day)
        }
    }
    
    func next(_ weekday: Weekday, onOrAfter day: Day) -> Day {
        if self.weekday(for: day) == weekday {
            return day
        } else {
            return next(weekday, after: day)
        }
    }
}

public extension Region {
    
    var today: Day {
        return Day(date: dateProvider.date, region: self)
    }
    
    var thisMonth: Month {
        return Month(date: dateProvider.date, region: self)
    }
    
    var thisYear: Year {
        return Year(date: dateProvider.date, region: self)
    }
}
