//
//  ViewController.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, Storyboarded {

    @IBOutlet weak private var collectionView: UICollectionView!
     
    private lazy var dataSource: UICollectionViewDiffableDataSource = {
        UICollectionViewDiffableDataSource<CalendarSection, CalendarViewItemModel>()
    }()
    
    var calendarViewModel: CalendarViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
    }

    private func configureCollectionView() {
        collectionView.register(cellType: CalendarCell.self)
        collectionView.delegate = self
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
           dataSource = UICollectionViewDiffableDataSource<CalendarSection, CalendarViewItemModel>(collectionView: collectionView) { [weak self] (collectionView: UICollectionView, indexPath: IndexPath, calendarViewItemModel: CalendarViewItemModel)  ->  UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(with: CalendarCell.self, for: indexPath)
            
            if let viewModel = self?.calendarViewModel?.getItem(forIndex: indexPath.row) {
                cell.configureCell(viewModel)
            }
             return cell
           }
        }
    
    func configureSnapShot() {
        var initialSnapShot = NSDiffableDataSourceSnapshot<CalendarSection, CalendarViewItemModel>()
        initialSnapShot.appendSections([.main])
        guard let viewModel = calendarViewModel else { return }
        initialSnapShot.appendItems(viewModel.getAllItems())
        dataSource.apply(initialSnapShot, animatingDifferences: true)
    }
      
}

extension CalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let viewModel = calendarViewModel else { return }
        self.showCalendarAlert(viewModel.getItemDescription(forIndex: indexPath.row))
        
    }
}

