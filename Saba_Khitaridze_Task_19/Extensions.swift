//
//  Extensions.swift
//  Saba_Khitaridze_Task_19
//
//  Created by Saba Khitaridze on 21.07.22.
//

import UIKit

extension UIView {
    func gradientForView(with gradientMask: CAGradientLayer) {
        gradientMask.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradientMask.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientMask.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientMask.locations = [0, 1]
        gradientMask.frame = bounds
        
        layer.insertSublayer(gradientMask, at: 0)
    }
    
    func setCenterX(equalTo: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        self.centerXAnchor.constraint(equalTo: equalTo.centerXAnchor, constant: constant)
    }
}


extension CALayer {
    func addShadow() {
        self.shadowColor = UIColor.black.cgColor
        self.shadowOffset = CGSize(width: 12.0, height: 12.0)
        self.shadowRadius = 10.0
        self.shadowOpacity = 0.3
    }
}

extension UITextField {
    func addShadow() {
        self.layer.addShadow()
        
        //for shadow making on textField
        self.borderStyle = .none
        self.backgroundColor = .white
        //padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
}
