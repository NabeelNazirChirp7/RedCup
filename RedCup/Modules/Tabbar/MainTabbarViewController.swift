//
//  MainTabbarViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import UIKit
import SideMenu

class MainTabbarViewController: UITabBarController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - UIActions
    @IBAction func didTapHamburgerIcon(_ sender: Any) {
        if let vc: SideMenuViewController = UIStoryboard.initiateViewController(storyboard: .sideMenu) {
            let menu = SideMenuNavigationController(rootViewController: vc)
            menu.leftSide = true
            menu.presentationStyle = .menuSlideIn
            menu.menuWidth = UIScreen.main.bounds.width * 0.8
            present(menu, animated: true)
        }
    }
}
