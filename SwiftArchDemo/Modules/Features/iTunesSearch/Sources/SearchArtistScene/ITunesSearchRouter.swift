//
//  ITunesSearchRouter.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import UIKit
import Services
import AppFoundation
import OnboardingShared

@MainActor
public protocol ITunesSearchRouterProtocol: AnyObject {
    func pushSearch(
        into navigationController: UINavigationController,
        animated: Bool)
}

@MainActor
final class ITunesSearchRouter {
    weak var controller: UIViewController?
    var presenter: ITunesSearchViewOutput
    private let onboardingRouter: OnboardingRouterProtocol
    
    init(
        controller: UIViewController? = nil,
        presenter: ITunesSearchViewOutput,
        onboardingRouter: OnboardingRouterProtocol
    ) {
        self.controller = controller
        self.presenter = presenter
        self.onboardingRouter = onboardingRouter
    }
}

extension ITunesSearchRouter: ITunesSearchRouterProtocol {
    func pushSearch(
        into navigationController: UINavigationController,
        animated: Bool
    ) {
        guard let controller = controller else { return }
        navigationController.pushViewController(
            controller,
            animated: animated)
        
        let onboardingNavigationController = UINavigationController()
        onboardingNavigationController.modalPresentationStyle = .fullScreen
        controller.present(onboardingNavigationController, animated: true)
        onboardingRouter.startOnboarding(in: onboardingNavigationController) {
            controller.dismiss(animated: true)
        }
    }
}

extension ModuleProvider {
    public class func makeITunesSearch(injection: iTunesSearchModuleInjectionProtocol) -> ITunesSearchRouterProtocol {
        return iTunesSearchModuleAssembler.makeModule(injection: injection)
    }
}

@MainActor
public protocol iTunesSearchModuleInjectionProtocol {
    var webApiManager: WebAPIManagerProtocol { get }
    var onboardingRouter: OnboardingRouterProtocol { get }
}
