//
//  CalendarCell.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit
class CalendarCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: CalendarCell.self)
  @IBOutlet weak var dayLabel: UILabel!
    
    func configureCell(_ viewModel: CalendarViewModel) {
        dayLabel.text = viewModel.day
        self.backgroundColor = viewModel.isActive ? UIColor.systemGreen : UIColor.systemRed
        self.isUserInteractionEnabled = viewModel.isActive
    }
}
