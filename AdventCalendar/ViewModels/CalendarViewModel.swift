//
//  CalendarViewModel.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation
import UIKit

import Foundation

struct CalendarViewModel {
    
    private var items: [CalendarItemViewModel]
    
    init(withGiftStore giftStore: GiftStore) {
        self.items = giftStore.gifts.map{CalendarItemViewModel($0)}.shuffled()
    }
    
    func getAllItems() -> [CalendarItemViewModel] {
         items
    }
    
    func getItem(forIndex index: Int) -> CalendarItemViewModel {
         items[index]
    }
    
    func getItemDescription(forIndex index: Int) -> String {
         self.getItem(forIndex: index).giftDescription
    }
}
