//
//  CutomButton.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import UIKit

public class CustomButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
