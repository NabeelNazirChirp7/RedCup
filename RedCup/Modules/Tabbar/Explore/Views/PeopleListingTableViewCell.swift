//
//  PeopleListingTableViewCell.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import UIKit

class PeopleListingTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var listingCV: UICollectionView!
    
    func setupCollectionView() {
        listingCV.delegate = self
        listingCV.dataSource = self
        
        listingCV.register(UINib(nibName: PeopleCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: PeopleCollectionViewCell.className)
    }
    
}

// MARK: - Collectionview delegate and Datasource
extension PeopleListingTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.className, for: indexPath) as? PeopleCollectionViewCell else { return PeopleCollectionViewCell() }
        
        return cell
    }
}
