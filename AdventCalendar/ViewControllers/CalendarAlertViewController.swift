//
//  CalendarAlertViewController.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit

class CalendarAlertViewController: UIViewController, Storyboarded {
    // MARK: Outlets
    @IBOutlet weak private var messageLabel: UILabel!
    
    // MARK: Properties
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
        configureSnowView()
    }
    //setting up snow particle animation
    private func configureSnowView() {
        
        let snow = SnowParticleView()
        snow.translatesAutoresizingMaskIntoConstraints = false
        snow.particleImage = UIImage(named: "snow")
        view.addSubview(snow)
        snow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            snow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            snow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            snow.topAnchor.constraint(equalTo: view.topAnchor),
            snow.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        //setting dismiss tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissTap))
        snow.addGestureRecognizer(tap)
    }
    
    @objc private func dismissTap(_ sender: UITapGestureRecognizer? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
}
