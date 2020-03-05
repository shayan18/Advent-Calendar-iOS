//
//  Extension+Date.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation
extension Date {
    
    func getCurrentWeekDay() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: Date()).weekday
    }
}

