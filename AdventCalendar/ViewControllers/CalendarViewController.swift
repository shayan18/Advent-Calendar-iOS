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
     
    private lazy var dataSource: UICollectionViewDiffableDataSource = {
        UICollectionViewDiffableDataSource<CalendarSection, CalendarViewModel>()
    }()
    private var viewModels = [CalendarViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
    }

    private func configureCollectionView() {
        collectionView.register(UINib(nibName: CalendarCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CalendarCell.reuseIdentifier)
        collectionView.delegate = self
        viewModels = getGifts().map{CalendarViewModel($0)}
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        configureDataSource()
        configureSnapShot()
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
    
      func configureDataSource() {
           dataSource = UICollectionViewDiffableDataSource<CalendarSection, CalendarViewModel>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, calendarViewModel: CalendarViewModel) -> UICollectionViewCell? in

             guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.reuseIdentifier, for: indexPath) as? CalendarCell else { return nil }

             return cell
           }
        }
    
    func configureSnapShot() {
        
        var initialSnapShot = NSDiffableDataSourceSnapshot<CalendarSection, CalendarViewModel>()
        initialSnapShot.appendSections([.main])
        initialSnapShot.appendItems(viewModels)
        dataSource.apply(initialSnapShot, animatingDifferences: true)
    }
      

}

extension CalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CalendarViewController {
    private func getGifts() -> [Gift] {
       return GiftStore().gifts
    }
}
