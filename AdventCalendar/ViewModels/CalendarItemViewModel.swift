//
//  CalendarViewItemModel.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 07/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation

struct CalendarItemViewModel: Hashable {
    
    private let gift: Gift
    
    init(_ model: Gift) {
        self.gift = model
    }
    
    func activateCalendarDay(_ day: Int)-> Bool {
        if let currentDay = Date().getCurrentWeekDay() {
            return day <= currentDay
        }
        return false
    }
}

extension CalendarItemViewModel {
    
    var isActive: Bool {
        return activateCalendarDay(gift.day)
    }
    
    var day: String {
        return "\(gift.day)"
    }
    
    var giftDescription: String {
        return "Yahooo! You Got \(gift.name)"
    }
}

extension CalendarItemViewModel {
    static func == (lhs: CalendarItemViewModel, rhs: CalendarItemViewModel) -> Bool {
        return lhs.gift.day == rhs.gift.day
        
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(gift.day)
    }
}

