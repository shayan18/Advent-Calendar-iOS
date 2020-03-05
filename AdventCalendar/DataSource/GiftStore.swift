//
//  GiftStore.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import Foundation

struct GiftStore {

let gifts = [("Water Bottle", 1),
             ("Wooden Toys", 2),
             ("Toblerone", 3),
             ("Toblerone", 4),
             ("Toblerone", 5),
             ("Toblerone", 6),
             ("Toblerone", 7),
             ("Toblerone", 8),
             ("Toblerone", 9),
             ("Toblerone", 10),
             ("Toblerone", 11),
             ("Wooden Toys",12),
             ("Toblerone", 13),
             ("Toblerone", 14),
             ("Toblerone", 15),
             ("Toblerone", 16),
             ("Toblerone", 17),
             ("Toblerone", 18),
             ("Toblerone", 19),
             ("Toblerone", 20),
             ("Toblerone", 21),
             ("Toblerone", 22),
             ("Toblerone", 23),
             ("Toblerone", 24)
    ]
            .map{Gift(day: $0.1, name: $0.0)}.shuffled()
}
