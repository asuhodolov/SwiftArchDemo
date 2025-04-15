//
//  File.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import Services
import OnboardingShared
import AppFoundation
import Onboarding
import iTunesSearch

@MainActor
public protocol RootModuleProtocol {
    var services: Services { get }
}

@MainActor
public final class RootModule: RootModuleProtocol {
    public let services = Services()
    
    public lazy var iTunesSearchRouter: any ITunesSearchRouterProtocol = {
        let onboardingRouter = ModuleProvider.makeOnboarding(injection: OnboardingModuleInjection(rootModule: self))
        return ModuleProvider.makeITunesSearch(
            injection: ITunesSearchModuleInjection(
            rootModule: self,
            onboardingRouter: onboardingRouter))
    }()
    
    public init() {}
}
