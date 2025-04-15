//
//  OnboardingRouter.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import FeaturesShared
import UIKit

final class OnboardingRouter: OnboardingRouterProtocol {
    private var injection: OnboardingModuleInjection?
    
    func startOnboarding(
        in navigationController: UINavigationController,
        injection: OnboardingModuleInjection
    ) {
        self.injection = injection
    }
}
