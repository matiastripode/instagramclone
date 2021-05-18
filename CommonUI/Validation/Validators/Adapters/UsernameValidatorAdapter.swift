//
//  UsernameValidatorAdapter.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public struct UsernameValidatorAdapter: UsernameValidator {
    public init() {}
    
    public func isValid(username: String) -> FieldValidatorResult {
        if username.isEmpty {
            return .empty
        } else if username.count >= 8 {
            return .isValid
        }
        return .error
    }

}
