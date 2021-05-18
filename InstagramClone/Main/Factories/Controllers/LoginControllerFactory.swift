//
//  LoginControllerFactory.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation
import CommonUI

func makeLoginController() -> LoginController {
    let controller = LoginController()
    let presenter = LoginPresenter(alertView: WeakVarProxy(controller), loadingView:  WeakVarProxy(controller))
    controller.login = presenter.login
    return controller
}
