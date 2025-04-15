//
//  IdentitySceneViewPresenter.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import Models

@MainActor
final class IdentitySceneViewPresenter {
    private let view: IdentitySceneViewInput?
    private var userIdentity: UserIdentity
    private var onConfirm: () -> Void
    
    init(
        view: IdentitySceneViewInput?,
        userIdentity: UserIdentity,
        onConfirm: @escaping () -> Void
    ) {
        self.view = view
        self.userIdentity = userIdentity
        self.onConfirm = onConfirm
    }
    
    private func prepareView() {
        view?.set(
            firstName: userIdentity.firstName,
            lastName: userIdentity.lastName)
    }
}

extension IdentitySceneViewPresenter: IdentitySceneViewOutput {
    func viewDidLoad() {
        prepareView()
    }
    
    func userDidPressConfirm() {
        onConfirm()
    }
}
