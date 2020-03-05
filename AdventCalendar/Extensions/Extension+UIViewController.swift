//
//  Extension+UIViewController.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit
extension UIViewController {
    func showCalendarAlert(_ message: String) {
        let vc = CalendarAlertViewController.instantiate()
        vc.message = message
        self.present(vc, animated: true, completion: nil)
    }
}
