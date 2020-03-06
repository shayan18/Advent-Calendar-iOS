//
//  CalendarCell.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit
class CalendarCell: UICollectionViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    
    func configureCell(_ viewModel: CalendarItemViewModel) {
        dayLabel.text = viewModel.day
        self.isUserInteractionEnabled = viewModel.isActive
        self.backgroundColor = viewModel.isActive ? #colorLiteral(red: 0.2039999962, green: 0.7799999714, blue: 0.3490000069, alpha: 1) : #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        
    }
}
