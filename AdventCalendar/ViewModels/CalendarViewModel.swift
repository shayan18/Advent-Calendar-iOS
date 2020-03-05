//
//  CalendarViewModel.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation
import UIKit

struct  CalendarViewModel: Hashable {
    
    private let model: Gift
    
    init(_ model: Gift) {
        self.model = model
    }
    
    func getGifts() -> [CalendarViewModel] {
        GiftStore().gifts.map{CalendarViewModel($0)}
    }
    
     func activateCalendarDay(_ day: Int)-> Bool {
           if let currentDay = Date().getCurrentWeekDay() {
                          return day <= currentDay
                      }
            return false
    }
}

extension CalendarViewModel {
    
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

extension CalendarViewModel {
    static func == (lhs: CalendarViewModel, rhs: CalendarViewModel) -> Bool {
          return lhs.model.day == rhs.model.day
          
         }
      func hash(into hasher: inout Hasher) {
        hasher.combine(model.day)
        }
}
