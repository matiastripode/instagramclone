//
//  RegistrationControllerFactory.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation
import CommonUI

func makeRegistrationController() -> RegistrationController {
    let controller = RegistrationController()
    let presenter = RegistrationPresenter(alertView: WeakVarProxy(controller),
                                          loadingView:  WeakVarProxy(controller))
    controller.register = presenter.register
    return controller
}
