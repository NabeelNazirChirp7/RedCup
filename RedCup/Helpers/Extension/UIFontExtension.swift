//
//  UIFontExtension.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation
import UIKit

extension UIFont {
    static var poppinsNormal: UIFont {
        get {
            UIFont(name: "Poppins-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
        }
    }
    
    static var poppinsBold: UIFont {
        get {
            UIFont(name: "Poppins-Bold", size: 12) ?? UIFont.boldSystemFont(ofSize: 12)
        }
    }
}
