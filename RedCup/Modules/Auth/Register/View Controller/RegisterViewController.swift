//
//  RegisterViewController.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import UIKit
import FlagPhoneNumber

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var phonePickerTF: FPNTextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var phonePickerBottomConst: NSLayoutConstraint!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addObserser()
    }
    
    // MARK: - AddObservers
    private func addObserser() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            phonePickerBottomConst.constant = keyboardSize.height
        }
    }

    @objc private func keyboardWillHide(notification: Notification) {
        phonePickerBottomConst.constant = 40
    }
    
    private func setupViews() {
        nextBtn.addGradientLayer(colors: [
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
            UIColor.primaryRed?.cgColor ?? UIColor.red.cgColor,
            UIColor.darkRedGradient?.cgColor ?? UIColor.red.cgColor,
        ])
        
        if let subView = view.viewWithTag(1) {
            subView.roundTopCorner(radius: 15)
        }
        
        descriptionLbl.attributedText = NSMutableAttributedString()
            .normal(string: "By registering you accept our ", color: UIColor.secondaryTextColor ?? .white)
            .bold(string: "Terms of Use ")
            .normal(string: "and ", color: UIColor.secondaryTextColor ?? .white)
            .bold(string: "Privacy Policy")
        
        setupTextField()
    }
    
    private func setupTextField() {
        phonePickerTF.textColor = .primaryTextColor
        phonePickerTF.hasPhoneNumberExample = false
        phonePickerTF.placeholder = "0000000"
        phonePickerTF.displayMode = .list
    }
    
    // MARK: - UIActions
    @IBAction func didTapNext(_ sender: Any) {
        if let vc: VerifyOTPViewController = UIStoryboard.initiateViewController(storyboard: .auth) {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.emailOrNumber = "+1 504-632-5043"
            present(vc, animated: true)
        }
    }
}
