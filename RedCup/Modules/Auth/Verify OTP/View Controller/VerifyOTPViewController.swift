//
//  VerifyOTPViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import UIKit
import PinCodeTextField

class VerifyOTPViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var pinCodeTF: PinCodeTextField!
    
    // MARK: - Constants and variables
    var emailOrNumber: String?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        isModalInPresentation = true
    }
    
    private func setupViews() {
        descLbl.attributedText = NSMutableAttributedString()
            .normal(fontSize: 13, string: "A four-digit ", color: .secondaryTextColor ?? .white)
            .normal(fontSize: 13, string: "Red", color: .primaryRed ?? .red)
            .normal(fontSize: 13, string: "Cup", color: .white)
            .normal(fontSize: 13, string: " code has been sent to \(emailOrNumber ?? DefaultValue.string). Please enter it below to validate your device.", color: .secondaryTextColor ?? .white)
        
        setupPinCodeTF()
    }
    
    private func setupPinCodeTF() {
        pinCodeTF.font = UIFont.poppinsNormal.withSize(25)
        pinCodeTF.becomeFirstResponder()
        pinCodeTF.keyboardType = .numberPad
        pinCodeTF.delegate = self
    }
}

// MARK: - PinCodeTextFieldDelegate
extension VerifyOTPViewController: PinCodeTextFieldDelegate {
    func textFieldValueChanged(_ textField: PinCodeTextField) {
        if textField.text?.count == 4 {
            if let vc: PermissionsNavViewController = UIStoryboard.initiateViewController(storyboard: .setupAccount) {
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overCurrentContext
                present(vc, animated: true)
            }
        }
    }
}
