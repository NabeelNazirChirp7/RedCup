//
//  OptionalExtension.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation

extension Optional {
    var isSome: Bool {
        get {
            self != nil
        }
    }
    
    var isNone: Bool {
        get {
            self == nil
        }
    }
}
