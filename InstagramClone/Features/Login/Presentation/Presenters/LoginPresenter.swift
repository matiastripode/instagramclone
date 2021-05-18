//
//  LoginPresenter.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation
import CommonUI


final class LoginPresenter {
    private let emailValidation = EmailValidation(fieldName: "email",
                                                  validator: EmailValidatorAdapter())
    private let passwordValidation = PasswordValidation(fieldName: "password",
                                                        validator: PasswordValidatorAdapter())
    private var validator: ValidationComposite!
    
    private var alertView: AlertView!
    private var loadingView: LoadingView!
    
    init(alertView: AlertView, loadingView: LoadingView) {
        validator = ValidationComposite(validations: [emailValidation, passwordValidation])
        self.alertView = alertView
        self.loadingView = loadingView
    }
    func login(request: LoginRequest) {
        let toValidate = ["email":  request.email,
                          "password": request.password]
        
        if let message = validator.validate(fields: toValidate) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Validation Failed",
                                                            message: message))
        } else {
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            //TODO: call login service
            let queue = DispatchQueue(label: "", qos: .background)
            queue.asyncAfter(deadline: .now() + 5) { [weak self] in
                self?.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            }
            
        }
    }
}
