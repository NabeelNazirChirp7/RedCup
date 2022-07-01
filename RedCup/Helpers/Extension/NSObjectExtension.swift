//
//  NSObjectExtension.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: self.self)
    }
}
