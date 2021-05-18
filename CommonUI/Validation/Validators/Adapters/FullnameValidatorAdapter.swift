//
//  FullnameValidatorAdapter.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public struct FullnameValidatorAdapter: FullnameValidator {
    public init() {}
    
    public func isValid(fullname: String) -> FieldValidatorResult {
        if fullname.isEmpty {
            return .empty
        } else if fullname.count >= 8 {
            return .isValid
        }
        return .error
    }

}
