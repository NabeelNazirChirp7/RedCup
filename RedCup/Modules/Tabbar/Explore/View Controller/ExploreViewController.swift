//
//  ExploreViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var filterBtn: UIButton!
    
    @IBOutlet weak var filterCV: UICollectionView!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Constants and variables
    private var exploreVM = ExploreViewModel()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    
    private func setupView() {
        filterBtn.addGradientLayer(colors: [
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
            UIColor.primaryRed?.cgColor ?? UIColor.red.cgColor,
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
        ])
        
        setupCollectionView()
        setupTableView()
    }
    
    private func setupCollectionView() {
        filterCV.delegate = self
        filterCV.dataSource = self
        
        filterCV.register(UINib(nibName: FilterCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: FilterCollectionViewCell.className)
        
        filterCV.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(UINib(nibName: SmallEventTableViewCell.className, bundle: nil), forCellReuseIdentifier: SmallEventTableViewCell.className)
        mainTableView.register(UINib(nibName: EventTableViewCell.className, bundle: nil), forCellReuseIdentifier: EventTableViewCell.className)
        mainTableView.register(UINib(nibName: PeopleListingTableViewCell.className, bundle: nil), forCellReuseIdentifier: PeopleListingTableViewCell.className)
        
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 900
        
        mainTableView.contentInset.bottom = 20
    }
}

// MARK: - Collectionview delegate and Datasource
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exploreVM.filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.className, for: indexPath) as? FilterCollectionViewCell else { return FilterCollectionViewCell() }
        
        cell.item = exploreVM.filters[indexPath.item]
        
        return cell
    }
}

// MARK: - Tableview delegate and Datasource
extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        exploreVM.headersList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 3
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: EventHeader = .fromNib()
        header.headerLbl.text = exploreVM.headersList[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            if indexPath.section == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleListingTableViewCell.className, for: indexPath) as? PeopleListingTableViewCell else { return PeopleListingTableViewCell() }
                
                cell.setupCollectionView()
                
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SmallEventTableViewCell.className, for: indexPath) as? SmallEventTableViewCell else { return SmallEventTableViewCell() }
                
                cell.setupCollectionView()
                
                return cell
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.className, for: indexPath) as? EventTableViewCell else { return EventTableViewCell() }
            
            cell.privateView.isHidden = indexPath.section != 0
                        
            return cell
        }
    }
}
