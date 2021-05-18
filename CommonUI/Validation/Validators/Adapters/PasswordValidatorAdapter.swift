//
//  PasswordValidatorAdapter.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation

public struct PasswordValidatorAdapter: PasswordValidator {
    public init() {}
    
    public func isValid(password: String) -> FieldValidatorResult {
        if password.isEmpty {
            return .empty
        } else if password.count >= 8 {
            return .isValid
        }
        return .error
    }

}
