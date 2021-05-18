//
//  AttributedButton.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import UIKit

public class AttributedButton: UIButton {
    public convenience init(firstPart: String, secondParth: String) {
        self.init(frame: .zero)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16)]
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: attributes)
        
        let boldAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        attributedTitle.append(NSAttributedString(string: secondParth,
                                                  attributes: boldAttributes))
        setAttributedTitle(attributedTitle, for: .normal)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
