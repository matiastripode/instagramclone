//
//  UsernameValidation.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public struct UsernameValidation: Validation, Equatable {
    private let fieldName: String
    private let validator: UsernameValidator

    public init(fieldName: String,  validator: UsernameValidator) {
        self.fieldName = fieldName
        self.validator = validator
    }

    public func validate(fields: [String : Any]?) -> String? {
        guard let fieldValue = fields?[fieldName] as? String else {
            return nil
        }
        let result = validator.isValid(username: fieldValue)
        switch result {
        case .empty: return nil
        case .isValid: return nil
        case .error: return "Error in \(fieldName)"
        }
    }

    public static func == (lhs: UsernameValidation, rhs: UsernameValidation) -> Bool {
        return lhs.fieldName == rhs.fieldName
    }
}
