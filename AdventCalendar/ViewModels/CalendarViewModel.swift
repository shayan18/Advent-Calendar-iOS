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
    
    private var items: [CalendarViewItemModel]
    
    init(withGiftStore giftStore: GiftStore) {
        self.items = giftStore.gifts.map{ CalendarViewItemModel($0) }.shuffled()
    }
    
    func getAllItems() -> [CalendarViewItemModel] {
        return items
    }

    func getItem(forIndex index: Int) -> CalendarViewItemModel {
        return items[index]
    }
    
    func getItemDescription(forIndex index: Int) -> String {
        return self.getItem(forIndex: index).giftDescription
    }
}
