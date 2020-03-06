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
                 ("Frozen II Elsa’s Jewelry", 3),
                 ("3D Dinosaur Light", 4),
                 ("Essential Oil Diffuser Bracelet", 5),
                 ("Terrarium Candle", 6),
                 ("Murder Mystery Game", 7),
                 ("Bottle Stopper Garden Kit", 8),
                 ("Multiple Name Necklace", 9),
                 ("Etched Skyline Wine Glass", 10),
                 ("Heat Changing Cat Mug", 11),
                 ("Charging Cord Bracelet",12),
                 ("Cinderella Wearable Blanket", 13),
                 ("Portable LCD Projector", 14),
                 ("Custom Disney Tote Bag", 15),
                 ("Personalized Pet Portrait Keychain", 16),
                 ("Echo Glow", 17),
                 ("Bluetooth Wood Speaker Dock", 18),
                 ("Cashmere Long Robe", 19),
                 ("Picnic Backpack", 20),
                 ("Garden Seat", 21),
                 ("Bull Catchall", 22),
                 ("Moonshine Magic Kit", 23),
                 ("Bootleg Barrel Kit", 24)
        ]
        .map{Gift(day: $0.1, name: $0.0)}
}
