//
//  NotificationPermissionViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import UIKit

class NotificationPermissionViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var turnOnNotificationBtn: UIButton!

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        turnOnNotificationBtn.addGradientLayer(colors: [
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
            UIColor.primaryRed?.cgColor ?? UIColor.red.cgColor,
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
        ])
    }
    
    // MARK: - UIActions
    @IBAction func didTapBackBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapTurnOnNotification(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
            guard let `self` = self else { return }
            if error.isSome {
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            
            if granted {
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else { return }
                    if let vc: LocationPermissionViewController = UIStoryboard.initiateViewController(storyboard: .setupAccount) {
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                }
            }
        }
    }
}
