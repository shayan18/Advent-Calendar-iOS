//
//  SceneDelegate.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let giftStore = GiftStore()
        let calendarVC = CalendarViewBuilder.buildCalendarView(withGiftStore: giftStore)
        self.window?.rootViewController = calendarVC
        self.window?.makeKeyAndVisible()
    }
}

