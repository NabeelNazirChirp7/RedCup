//
//  UIViewControllerExtension.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertMessage(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
