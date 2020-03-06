//
//  Extension+UICollectionViewCell.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit
extension UICollectionView {
    public func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
        
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}

