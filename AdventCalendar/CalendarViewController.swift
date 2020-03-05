//
//  ViewController.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak private var collectionView: UICollectionView!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
    }

    private func configureCollectionView() {
        collectionView.register(UINib(nibName: CalendarCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CalendarCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.collectionViewLayout = configureCollectionViewLayout()
    }
    
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
      
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
       
       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
       
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
       
       let section = NSCollectionLayoutSection(group: group)
       section.interGroupSpacing = 10
       return UICollectionViewCompositionalLayout(section: section)
      }
    
//      func configureDataSource() {
//           dataSource = UICollectionViewDiffableDataSource<CalendarSection, Gift>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, tutorial: Gift) -> UICollectionViewCell? in
//             
//             guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.reuseIdentifier, for: indexPath) as? CalendarCell else { return nil }
//             
//             return cell
//           }
//        }
      

}

extension CalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
