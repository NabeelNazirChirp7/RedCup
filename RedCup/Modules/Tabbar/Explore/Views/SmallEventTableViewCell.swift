//
//  SmallEventTableViewCell.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import UIKit

class SmallEventTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: HorizontalEventItemCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: HorizontalEventItemCollectionViewCell.className)
    }
    
}

extension SmallEventTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalEventItemCollectionViewCell.className, for: indexPath) as? HorizontalEventItemCollectionViewCell else {
            return HorizontalEventItemCollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 180)
    }
}
