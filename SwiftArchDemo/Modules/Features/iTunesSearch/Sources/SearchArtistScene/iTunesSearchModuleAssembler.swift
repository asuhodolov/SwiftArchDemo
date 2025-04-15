//
//  iTunesSearchModuleAssembler.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import UIKit
import AppFoundation
import Services
import OnboardingShared

private struct StoryboardName {
    static let iTunesSearch = "ITunesSearchViewController"
}

@MainActor
final class iTunesSearchModuleAssembler {
    class func makeModule(
        injection: iTunesSearchModuleInjectionProtocol
    ) -> ITunesSearchRouterProtocol {
        let storyborad = UIStoryboard(
            name: StoryboardName.iTunesSearch,
            bundle: Bundle.module)
        
        let albumsProvider = ArtistAlbumsProvider(webApiManager: injection.webApiManager)
        let presenter = ITunesSearchPresenter(albumsProvider: albumsProvider)
        
        guard let viewController = storyborad.instantiateViewController(
            withIdentifier: ITunesSearchViewController.identifier
        ) as? ITunesSearchViewController else {
            assertionFailure("Can not initialize ITunesSearchViewController")
            return ITunesSearchRouter(
                presenter: presenter,
                onboardingRouter: injection.onboardingRouter)
        }
        
        let router = ITunesSearchRouter(
            controller: viewController,
            presenter: presenter,
            onboardingRouter: injection.onboardingRouter)
        
        presenter.router = router
        presenter.view = viewController
        viewController.presenter = presenter
        
        viewController.retainedModuleElements = [
            router,
            presenter
        ]
        
        return router
    }
}
