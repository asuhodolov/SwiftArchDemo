//
//  OnboardingRouterProtocol.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit
import Services
import Models

@MainActor
public protocol OnboardingRouterProtocol {
    func startOnboarding(
        in navigationController: UINavigationController,
        onComplete: (() -> Void)?)
}

@MainActor
public protocol OnboardingModuleInjectionProtocol {
    var loginStorage: any ResourceStorable<UserIdentity> { get }
}
