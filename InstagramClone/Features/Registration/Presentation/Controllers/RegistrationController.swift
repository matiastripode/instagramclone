//
//  RegistrationController.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/15/21.
//

import UIKit
import CommonUI

class RegistrationController: UIViewController {
    // Binds with presenter
    public var register: ((RegistrationRequest) -> Void)?
    
    // MARK - Properties
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        return button
    }()
    private let emailTextField: UITextField = {
        let placeHolder = NSLocalizedString("email_placeholder",
                                            comment: "A placeholder for the email field.")
        let textField = CustomTextField(with: placeHolder, leftPadding: 5)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let placeHolder = NSLocalizedString("password_placeholder",
                                            comment: "A placeholder for the password field.")
        let textField = CustomTextField(with: placeHolder, leftPadding: 5)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullNameTextField: UITextField = {
        let placeHolder = NSLocalizedString("fullname_placeholder",
                                            comment: "A placeholder for the fullname field.")
        let textField = CustomTextField(with: placeHolder, leftPadding: 5)
        return textField
    }()
    
    private let usernameTextField: UITextField = {
        let placeHolder = NSLocalizedString("username_placeholder",
                                            comment: "A placeholder for the username field.")

        let textField = CustomTextField(with: placeHolder, leftPadding: 5)
        return textField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
        
    }()
    private let signupButton: UIButton = {
        let button = CustomButton(type: .system)
        let title = NSLocalizedString("signup_button",
                                            comment: "Sign-up button title.")

        
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = AttributedButton(firstPart: "Already have an account? ",
                                      secondParth: "Log in")
        button.addTarget(self, action: #selector(handleAlreadyHaveAnAccount), for: .touchUpInside)
        return button
    }()
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        setupGestureToHideKeyboard()
        setupViews()
    }

    func setupViews() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        fullNameTextField.delegate = self
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(signupButton)
        
        stackView.anchor(top: plusPhotoButton.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 20,
                         paddingLeft: 20,
                         paddingRight: 20)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        setupLoaderIndicator()
    }
    
    func setupLoaderIndicator() {
        view.addSubview(loadingIndicator)
        loadingIndicator.center(inView: view)
    }
    func setupGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    // MARK - Actions
    @objc func handleAlreadyHaveAnAccount() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func  handleRegistration() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let fullname = fullNameTextField.text ?? ""
        let username = usernameTextField.text ?? ""
        
        let request = RegistrationRequest(email: email,
                                          password: password,
                                          fullname: fullname,
                                          username: username)
        register?(request)
    }
}

extension RegistrationController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            DispatchQueue.main.async { [weak self] in
                self?.view.isUserInteractionEnabled = false
                self?.loadingIndicator.startAnimating()
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.view.isUserInteractionEnabled = true
                self?.loadingIndicator.stopAnimating()
            }
        }
    }
}

extension RegistrationController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self?.present(alert, animated: true)
        }
    }
        
}


// MARK - Hide keyboard
extension RegistrationController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
