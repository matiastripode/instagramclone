//
//  EmailValidatorAdapter.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation

public struct EmailValidatorAdapter: EmailValidator {
    private let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    public init() {}

    public func isValid(email: String) -> FieldValidatorResult {
        if email.isEmpty {
            return .empty
        }
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: pattern)
        
        if regex.firstMatch(in: email, options: [], range: range) != nil {
            return .isValid
        }
        return .error
    }
}
