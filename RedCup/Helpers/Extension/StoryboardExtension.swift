//
//  StoryboardExtension.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func initiateViewController<T: UIViewController>(storyboard: StroyboardEnum) -> T? {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: T.className) as? T
        return controller
    }
}

enum StroyboardEnum: String {
    case auth = "Auth"
    case setupAccount = "SetupAccount"
}
