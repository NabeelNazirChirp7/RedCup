//
//  InCollegeViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import UIKit

class InCollegeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var connectBtn: UIButton!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        emailTF.attributedPlaceholder = NSMutableAttributedString()
            .normal(fontSize: 14, string: "Enter your college email", color: .white)
        connectBtn.addGradientLayer(colors: [
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
            UIColor.primaryRed?.cgColor ?? UIColor.red.cgColor,
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
        ])
    }
    
    // MARK: - UIActions
    @IBAction func didTapBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: false)        
    }
    
    @IBAction func didTapConnectBtn(_ sender: Any) {
        if !InCollegeValidation.isValidEmail(email: emailTF.text ?? DefaultValue.string) {
            showAlertMessage(message: "Please enter valid email address")
            return
        }
        
        if let vc: VerifyOTPViewController = UIStoryboard.initiateViewController(storyboard: .auth) {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.emailOrNumber = emailTF.text
            present(vc, animated: true)
        }
    }
}
