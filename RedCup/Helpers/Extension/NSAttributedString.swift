//
//  NSAttributedString.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    func normal(fontSize: CGFloat = 12, string: String, color: UIColor = UIColor.white) -> NSMutableAttributedString {
        let normalFont = UIFont.poppinsNormal.withSize(fontSize)
        let attributes = [
            NSAttributedString.Key.font: normalFont,
            NSAttributedString.Key.foregroundColor: color
        ]
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        append(attributedString)
        return NSMutableAttributedString(attributedString: self)
    }
    
    func bold(fontSize: CGFloat = 12, string: String, color: UIColor = UIColor.white) -> NSMutableAttributedString {
        let boldFont = UIFont.poppinsBold.withSize(fontSize)
        let attributes = [
            NSAttributedString.Key.font: boldFont,
            NSAttributedString.Key.foregroundColor: color
        ]
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        append(attributedString)
        return NSMutableAttributedString(attributedString: self)
    }
}
