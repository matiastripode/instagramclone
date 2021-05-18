//
//  CustomeTextField.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import UIKit

public class CustomTextField: UITextField {
    private var padding: UIEdgeInsets!
    
    public convenience init(with placeHolder: String, leftPadding: Int = 0) {
        self.init(frame: .zero)
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                   attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        padding = UIEdgeInsets(top: 0, left: CGFloat(leftPadding), bottom: 0, right: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Padding for place holder
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
