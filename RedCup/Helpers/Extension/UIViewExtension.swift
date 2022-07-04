//
//  UIViewExtension.swift
//  RedCup
//
//  Created by Chirp Technologies on 01/07/2022.
//

import Foundation
import UIKit

extension UIView {
    func addGradientLayer(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at:0)
    }
    
    func roundTopCorner(radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        } set {
            layoutIfNeeded()
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            UIColor(cgColor: layer.borderColor ?? UIColor.white.cgColor)
        } set {
            layoutIfNeeded()
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            layer.borderWidth
        } set {
            layoutIfNeeded()
            layer.borderWidth = newValue
        }
    }
    
    func dropShadow(shadowRadius: CGFloat = 5, offset: CGSize = CGSize(width: 10, height: 10)) {
        layer.shadowOffset = offset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = 0.3
    }
}
