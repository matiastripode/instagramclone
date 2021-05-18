//
//  UIViewController+Extensions.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import UIKit

public extension UIViewController {
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor,
                           UIColor.systemBlue.cgColor]
        
        gradient.locations  = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
