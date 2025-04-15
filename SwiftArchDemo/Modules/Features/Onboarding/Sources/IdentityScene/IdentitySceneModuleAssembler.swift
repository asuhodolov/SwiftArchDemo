//
//  IdentitySceneModuleAssembler.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit
import Models

@MainActor
final class IdentitySceneModuleAssembler {
    class func makeView(
        userIdentity: UserIdentity,
        onConfirm: @escaping () -> Void
    ) -> UIViewController {
        let viewController = IdentitySceneView()
        let presenter = IdentitySceneViewPresenter(
            view: viewController,
            userIdentity: userIdentity,
            onConfirm: onConfirm)
        viewController.presenter = presenter
        
        viewController.retainedModuleElements = [
            presenter
        ]
        
        return viewController
    }
}
