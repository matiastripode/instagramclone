//
//  UsernameValidator.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation


public protocol UsernameValidator {
    func isValid(username: String) -> FieldValidatorResult
}
