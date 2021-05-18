//
//  FieldValidationTests.swift
//  CommonTests
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import XCTest
import CommonUI

class FieldValidationTests: XCTestCase {

    func test_when_password_and_email_are_valid_then_error_message_is_nil() throws {
        //Given
        let emailValidation = EmailValidation(fieldName: "email", validator: EmailValidatorAdapter())
        
        let passwordValidation = PasswordValidation(fieldName: "password", validator: PasswordValidatorAdapter())
        
        let validEmail = "validemail@gmail.com"
        let validPassword = "valid_password"
        
        let sut = ValidationComposite(validations: [emailValidation, passwordValidation])
        
        let toValidate = ["email": validEmail,
                          "password": validPassword]
        
        //When
        let errorMessage = sut.validate(fields: toValidate)
        
        //Then
        XCTAssertNil(errorMessage,
                     """
                     It failed asserting next acceptance test:
                     Given a validation composite with email and password validations.
                     When both email and password are validated
                     Then no error message is returned
                     """)
    }
    
    func test_when_password_is_invalid_then_error_message_is_return() throws {
        //Given
        let emailValidation = EmailValidation(fieldName: "email", validator: EmailValidatorAdapter())
        let passwordValidation = PasswordValidation(fieldName: "password", validator: PasswordValidatorAdapter())

        let validEmail = "validemail@gmail.com"
        let invalidPassword = "short"
        
        let sut = ValidationComposite(validations: [emailValidation, passwordValidation])
        
        let toValidate = ["email": validEmail,
                          "password": invalidPassword]
        
        //When
        let errorMessage = sut.validate(fields: toValidate)
        
        //Then
        XCTAssertEqual(errorMessage,  "Error in password",
           """
           It failed asserting next acceptance test:
           Given a validation composite with email and password validations.
           When an invalid password is validated
           Then and error message is returned
           """)

    }
    
    func test_when_email_is_invalid_then_error_message_is_return() throws {
        //Given
        let emailValidation = EmailValidation(fieldName: "email", validator: EmailValidatorAdapter())
        let passwordValidation = PasswordValidation(fieldName: "password", validator: PasswordValidatorAdapter())
        
        let invalidEmail = "invalidemail@"
        let validPassword = "valid_password"
        
        let sut = ValidationComposite(validations: [emailValidation, passwordValidation])
        
        let toValidate = ["email": invalidEmail,
                          "password": validPassword]
        
        //When
        let errorMessage = sut.validate(fields: toValidate)
        
        //Then
        XCTAssertEqual(errorMessage,  "Error in email",
        """
        It failed asserting next acceptance test:
        Given a validation composite with email and password validations.
        When an invalid email is validated
        Then and error message is returned
        """)
    }
    
    
    func test_when_registration_fields_are_valid_then_validator_validates_them() throws {
        //Given
        let emailValidation = EmailValidation(fieldName: "email", validator: EmailValidatorAdapter())
        let passwordValidation = PasswordValidation(fieldName: "password", validator: PasswordValidatorAdapter())
        
        let invalidEmail = "invalidemail@"
        let validPassword = "valid_password"
        
        let sut = ValidationComposite(validations: [emailValidation, passwordValidation])
        
        let toValidate = ["email": invalidEmail,
                          "password": validPassword]
        
        //When
        let errorMessage = sut.validate(fields: toValidate)
        
        //Then
        XCTAssertEqual(errorMessage,  "Error in email",
        """
        It failed asserting next acceptance test:
        Given a validation composite with email and password validations.
        When an invalid email is validated
        Then and error message is returned
        """)
    }


}
