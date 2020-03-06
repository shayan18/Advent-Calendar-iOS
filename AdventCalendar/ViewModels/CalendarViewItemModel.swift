//
//  CalendarViewItemModel.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 07/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation

struct CalendarViewItemModel: Hashable {
    
    private let model: Gift
    
    init(_ model: Gift) {
        self.model = model
    }
    
    func activateCalendarDay(_ day: Int)-> Bool {
        if let currentDay = Date().getCurrentWeekDay() {
            return day <= currentDay
        }
        return false
    }
}

extension CalendarViewItemModel {
    
    var isActive: Bool {
        return activateCalendarDay(model.day)
    }
    
    var day: String {
        return "\(model.day)"
    }
    
    var giftDescription: String {
        return "Yahooo! You Got \(model.name)"
    }
}

extension CalendarViewItemModel {
    static func == (lhs: CalendarViewItemModel, rhs: CalendarViewItemModel) -> Bool {
        return lhs.model.day == rhs.model.day
        
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(model.day)
    }
}

