//
//  Validation.swift
//  PresentationLayer
//
//  Created by Carlos Matias Tripode on 4/17/21.
//

import Foundation

public protocol Validation {
    func validate(fields: [String: Any]?) -> String?
}
