//
//  ValidationComposite.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation

public struct ValidationComposite: Validation {
    private let validations: [Validation]
    
    public init(validations: [Validation]) {
        self.validations = validations
    }
    
    public func validate(fields: [String : Any]?) -> String? {
        for validation in validations {
            if let errorMessage = validation.validate(fields: fields) {
                return errorMessage
            }
        }
        return nil
    }
    
}
