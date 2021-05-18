//
//  FullnameValidation.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public struct FullnameValidation: Validation, Equatable {
    private let fieldName: String
    private let validator: FullnameValidator

    public init(fieldName: String,  validator: FullnameValidator) {
        self.fieldName = fieldName
        self.validator = validator
    }

    public func validate(fields: [String : Any]?) -> String? {
        guard let fieldValue = fields?[fieldName] as? String else {
            return nil
        }
        let result = validator.isValid(fullname: fieldValue)
        switch result {
        case .empty: return nil
        case .isValid: return nil
        case .error: return "Error in \(fieldName)"
        }
    }

    public static func == (lhs: FullnameValidation, rhs: FullnameValidation) -> Bool {
        return lhs.fieldName == rhs.fieldName
    }
}
