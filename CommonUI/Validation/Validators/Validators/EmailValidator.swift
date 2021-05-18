//
//  EmailValidator.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation


public protocol EmailValidator {
    func isValid(email: String) -> FieldValidatorResult
}
