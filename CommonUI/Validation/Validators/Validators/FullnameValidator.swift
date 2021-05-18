//
//  FirstnameValidator.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public protocol FullnameValidator {
    func isValid(fullname: String) -> FieldValidatorResult
}
