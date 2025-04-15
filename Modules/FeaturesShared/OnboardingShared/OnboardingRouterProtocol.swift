//
//  OnboardingRouterProtocol.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit

public protocol OnboardingRouterProtocol {
    func startOnboarding(
        in navigationController: UINavigationController,
        injection: OnboardingModuleInjection)
}

public struct OnboardingModuleInjection {
    static let a = ""
    let b = 4
}
