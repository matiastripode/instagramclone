//
//  RegistrationRequest.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

struct RegistrationRequest {
    var email: String
    var password: String
    var fullname: String
    var username: String
    
    var isEmpty: Bool {
        return email.isEmpty &&
            password.isEmpty &&
            fullname.isEmpty &&
            username.isEmpty
    }
}
