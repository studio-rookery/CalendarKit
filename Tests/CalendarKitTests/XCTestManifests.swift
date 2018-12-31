import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RegionTests.allTests),
        testCase(RegionDateTests.allTests),
        testCase(DayTests.allTests),
        testCase(WeekdayTests.allTests),
        testCase(IntTests.allTests)
    ]
}
#endif
