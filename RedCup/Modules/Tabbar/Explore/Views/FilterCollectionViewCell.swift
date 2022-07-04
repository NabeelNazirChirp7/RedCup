//
//  FilterCollectionViewCell.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dropDownIcon: UIImageView!
    
    // MARK: - Constants and variables
    var item: FilterItem? {
        didSet {
            locationIcon.isHidden = item?.type != .location
            dropDownIcon.isHidden = item?.type == .location
            
            titleLbl.text = item?.title
        }
    }

}
