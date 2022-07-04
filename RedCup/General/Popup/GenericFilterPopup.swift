//
//  GenericFilterPopup.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import Foundation
import UIKit

class GenericFilterPopup: UIView {
    // MARK: - Outlets
    @IBOutlet weak var mainStackView: UIStackView!
    
    // MARK: - Constants and variables
    var titles = [String]()
    
    // MARK: - Life Cycle Methods
    func setupView() {
        for title in titles {
            let label = createLabel()
            label.text = title
            mainStackView.addArrangedSubview(label)
        }
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.poppinsNormal.withSize(14)
        label.textColor = .primaryTextColor
        label.numberOfLines = 1
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }
}
