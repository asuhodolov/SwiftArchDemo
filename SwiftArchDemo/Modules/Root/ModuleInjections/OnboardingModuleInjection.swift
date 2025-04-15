//
//  OnboardingModuleInjection.swift
//  Root
//
//  Created by Alexander Suhodolov on 11/04/2025.
//

import Foundation
import Services
import OnboardingShared
import Models

@MainActor
final class OnboardingModuleInjection: OnboardingModuleInjectionProtocol {
    let loginStorage: any ResourceStorable<UserIdentity> = JSONFileRepository<UserIdentity>()
    
    private let rootModule: RootModuleProtocol
    
    init(rootModule: RootModuleProtocol) {
        self.rootModule = rootModule
    }
}
