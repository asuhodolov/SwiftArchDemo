//
//  ITunesSearchModuleInjection.swift
//  Root
//
//  Created by Alexander Suhodolov on 14/04/2025.
//

import Foundation
import Services
import iTunesSearch
import Models
import OnboardingShared

@MainActor
final class ITunesSearchModuleInjection: iTunesSearchModuleInjectionProtocol {
    let onboardingRouter: any OnboardingRouterProtocol
    
    var webApiManager: WebAPIManagerProtocol {
        rootModule.services.webApiManager
    }
    
    private let rootModule: RootModuleProtocol
    
    init(
        rootModule: RootModuleProtocol,
        onboardingRouter: any OnboardingRouterProtocol
    ) {
        self.rootModule = rootModule
        self.onboardingRouter = onboardingRouter
    }
}
