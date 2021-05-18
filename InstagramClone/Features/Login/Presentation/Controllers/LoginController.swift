//
//  LoginController.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/15/21.
//

import UIKit
import CommonUI

class LoginController: UIViewController {
    
    // Binds with presenter
    public var login: ((LoginRequest) -> Void)?
    
    // MARK - Properties
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
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
    
    private let loginButton: UIButton = {
        let button = CustomButton(type: .system)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        let title = NSLocalizedString("login_button",
                                            comment: "Login button title.")

        button.setTitle(title, for: .normal)
        button.isEnabled = false
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let firstPart = NSLocalizedString("donthaveaccount_1_button",
                                            comment: "Don't have account button title.")
        let secondPart = NSLocalizedString("donthaveaccount_2_button",
                                            comment: "Don't have account button title.")

        
        let button = AttributedButton(firstPart: firstPart + "  ",
                                      secondParth: secondPart)
        button.addTarget(self, action: #selector(handleDontHaveAccount), for: .touchUpInside)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let firstPart = NSLocalizedString("forgotpasswordbutton_1_button",
                                            comment: "Forgot password button title.")
        let secondPart = NSLocalizedString("forgotpasswordbutton_2_button",
                                            comment: "Forgot password button title.")
        
        let button = AttributedButton(firstPart: firstPart + "  ",
                                      secondParth: secondPart)
        button.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        return self.makeStackView()
    }()
    
    private var loginRequest = LoginRequest(email: "", password: "")
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        setupGestureToHideKeyboard()
        
        setupViews()
    }
    
    
    // MARK - configure UI
    
    func setupViews() {
        configureGradientLayer()
        view.addSubview(loadingIndicator)
        view.addSubview(stackView)
        
        setupTitle()
        setupTextFields()
        setupDonHaveAccountButton()
        setupForgotPasswordButton()
        setupLoaderIndicator()
        configureNotificationObservers()
        updateLoginButton()
    }
    func setupLoaderIndicator() {
        
        loadingIndicator.center(inView: view)
    }
    func setupTitle() {
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
    }
    func setupTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        stackView.anchor(top: iconImage.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 32,
                         paddingLeft: 32,
                         paddingRight: 32)
    }
    
    func setupDonHaveAccountButton() {
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func setupForgotPasswordButton() {
        stackView.addArrangedSubview(forgotPasswordButton)
    }
    
    func setupGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }
    
    // MARK - Actions
    @objc func handleLogin() {
        let request = LoginRequest(email: emailTextField.text ?? "",
                                   password: passwordTextField.text ?? "")
        login?(request)
    }
    @objc func handleDontHaveAccount() {
        print("handleDontHaveAccount")
        let vc = makeRegistrationController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func forgotPassword() {
        print("forgotPassword")
    }
    
    @objc func emailTextDidChange(sender: UITextField) {
        //TODO: refactor this logic
        loginRequest.email = sender.text ?? ""
        updateLoginButton()
    }
    
    @objc func passwordTextDidChange(sender: UITextField) {
        //TODO: refactor this logic
        loginRequest.password = sender.text ?? ""
        updateLoginButton()
    }
    // MARK - Texfield targets
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(emailTextDidChange),
                                 for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextDidChange),
                                    for: .editingChanged)
    }
    
    // MARK - Button
    func updateLoginButton() {
        loginButton.isEnabled = !loginRequest.isEmpty
        loginButton.backgroundColor = loginButton.isEnabled ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
}

extension LoginController: LoadingView {
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

extension LoginController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self?.present(alert, animated: true)
        }
    }
}

// MARK - Hide keyboard
extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
