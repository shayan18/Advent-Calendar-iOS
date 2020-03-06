//
//  ViewController.swift
//  AdventCalendar
//
//  Created by Shayan Ali on 05/03/2020.
//  Copyright © 2020 Shayan Ali. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, Storyboarded {
    // MARK: Outlets
    @IBOutlet weak private var collectionView: UICollectionView!
    
    // MARK: Properties
    private lazy var dataSource: UICollectionViewDiffableDataSource = {
        UICollectionViewDiffableDataSource<CalendarSection, CalendarItemViewModel>()
    }()
    var calendarViewModel: CalendarViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.register(cellType: CalendarCell.self)
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        configureDataSource()
        configureSnapShot()
    }
    
   private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<CalendarSection, CalendarItemViewModel>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, calendarViewItemModel: CalendarItemViewModel)  ->  UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(with: CalendarCell.self, for: indexPath)
            cell.configureCell(calendarViewItemModel)
            return cell
        }
    }
    
    private func configureSnapShot() {
        var initialSnapShot = NSDiffableDataSourceSnapshot<CalendarSection, CalendarItemViewModel>()
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

extension CalendarViewController {
   private func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        return UICollectionViewCompositionalLayout(section: section)
    }
}
