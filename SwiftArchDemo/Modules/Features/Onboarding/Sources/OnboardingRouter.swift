//
//  OnboardingRouter.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import OnboardingShared
import UIKit
import AppFoundation
import Models

@MainActor
final class OnboardingRouter {
    private struct Constants {
        static let UserIdentityResourceId = "UserIdentityResourceId"
    }
    
    private var injection: OnboardingModuleInjectionProtocol?
    private var navigationController: UINavigationController?
    
    private var userIdentity: UserIdentity
    private var onOnboardingCompletion: (() -> Void)?
    
    init(injection: OnboardingModuleInjectionProtocol? = nil) {
        self.injection = injection
        self.userIdentity = injection?.loginStorage.load(resourceId: Constants.UserIdentityResourceId) ?? UserIdentity()
    }
    
    private func presentFirstNameScene() {
        let view = FirstNameSceneAssembler.makeView(usingFirstName: userIdentity.firstName) { [weak self] firstName in
            self?.userIdentity.firstName = firstName
            self?.presentLastNameScene()
        }

        navigationController?.pushViewController(view, animated: false)
    }
    
    private func presentLastNameScene() {
        let view = LastNameSceneAssembler.makeView(usingLastName: userIdentity.lastName) { [weak self] lastName in
            self?.userIdentity.lastName = lastName
            self?.presentUserIdentityScene()
        }

        navigationController?.pushViewController(view, animated: true)
    }
    
    private func presentUserIdentityScene() {
        let view = IdentitySceneModuleAssembler.makeView(userIdentity: userIdentity) { [weak self] in
            try? self?.injection?.loginStorage.save(
                resource: self?.userIdentity,
                resourceId: Constants.UserIdentityResourceId)
            self?.onOnboardingCompletion?()
        }
        navigationController?.pushViewController(view, animated: true)
    }
}

extension OnboardingRouter: OnboardingRouterProtocol {
    func startOnboarding(
        in navigationController: UINavigationController,
        onComplete: (() -> Void)?
    ) {
        self.navigationController = navigationController
        self.onOnboardingCompletion = onComplete
        
        presentFirstNameScene()
    }
}

extension ModuleProvider {
    public class func makeOnboarding(injection: OnboardingModuleInjectionProtocol) -> OnboardingRouterProtocol {
        OnboardingRouter(injection: injection)
    }
}
