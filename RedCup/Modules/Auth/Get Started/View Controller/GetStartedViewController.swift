//
//  GetStartedViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var getStartedBtn: UIButton!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartedBtn.addGradientLayer(colors: [
                                                UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
                                                UIColor.primaryRed?.cgColor ?? UIColor.red.cgColor,
                                                UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
                                               ])
    }
    
    // MARK: - UIActions
    @IBAction func didTapGetStartedBtn(_ sender: Any) {
        
    }
    
    @IBAction func didTapSigninRegisterBtn(_ sender: Any) {
        if let vc: RegisterViewController = UIStoryboard.initiateViewController(storyboard: .auth) {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
    }
}
