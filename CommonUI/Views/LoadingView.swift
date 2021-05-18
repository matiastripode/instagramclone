//
//  LoadingView.swift
//  Common
//
//  Created by Carlos Matias Tripode on 5/16/21.
//

import Foundation

public protocol LoadingView {
    func display(viewModel: LoadingViewModel)
}

public struct LoadingViewModel: Equatable {
    public var isLoading: Bool

    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
