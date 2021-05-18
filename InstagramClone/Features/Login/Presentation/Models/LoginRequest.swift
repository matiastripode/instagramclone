//
//  LoginRequest.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

struct LoginRequest {
    var email: String
    var password: String
    
    var isEmpty: Bool {
        return email.isEmpty && password.isEmpty
    }
}
