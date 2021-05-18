//
//  EmailValidation.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation

public struct EmailValidation: Validation, Equatable {
    private let fieldName: String
    private let validator: EmailValidator

    public init(fieldName: String,  validator: EmailValidator) {
        self.fieldName = fieldName
        self.validator = validator
    }

    public func validate(fields: [String : Any]?) -> String? {
        guard let fieldValue = fields?[fieldName] as? String else {
            return nil
        }
        let result = validator.isValid(email: fieldValue)
        switch result {
        case .empty: return nil
        case .isValid: return nil
        case .error: return "Error in \(fieldName)"
        }
    }

    public static func == (lhs: EmailValidation, rhs: EmailValidation) -> Bool {
        return lhs.fieldName == rhs.fieldName
    }
}
