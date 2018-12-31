//
//  Region+Extension.swift
//  CalendarKit
//
//  Created by hirano masaki on 2019/01/01.
//

import Foundation
import CalendarKit

extension Region {
    
    /// +09:00
    static let tokyo: Region = {
        var region = Region.utc
        region.calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        return region
    }()
    
    /// -10:00
    static let honolulu: Region = {
        var region = Region.utc
        region.calendar.timeZone = TimeZone(identifier: "Pacific/Honolulu")!
        return region
    }()
    
}
