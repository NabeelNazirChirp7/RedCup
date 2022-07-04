//
//  SideMenuViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import UIKit

class SideMenuViewController: UIViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UIActions
    @IBAction func didTapCloseBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}
