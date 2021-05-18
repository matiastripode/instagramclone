//
//  PasswordValidator.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation

public protocol PasswordValidator {
    func isValid(password: String) -> FieldValidatorResult
}
