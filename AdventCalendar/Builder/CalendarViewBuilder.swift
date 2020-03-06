//
//  CalendarViewBuilder.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 07/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation

class CalendarViewBuilder {
    
    static func buildCalendarView(withGiftStore giftStore: GiftStore) -> CalendarViewController {
        let calendarVC = CalendarViewController.instantiate()
        calendarVC.calendarViewModel = CalendarViewModel(withGiftStore: giftStore)
        return calendarVC
    }
}
