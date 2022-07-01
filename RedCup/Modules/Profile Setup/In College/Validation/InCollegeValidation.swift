//
//  InCollegeValidation.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation

class InCollegeValidation {
    static func isValidEmail(email: String) -> Bool {
        if email.isEmpty {
            return false
        }
        
        if !email.isValidEmail() {
            return false
        }
        
        return true
    }
}
