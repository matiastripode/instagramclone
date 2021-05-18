//
//  WeakVarProxy.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public final class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?

    public init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        instance?.showMessage(viewModel: viewModel)
    }
}

extension WeakVarProxy: LoadingView where T: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        instance?.display(viewModel: viewModel)
    }
}
