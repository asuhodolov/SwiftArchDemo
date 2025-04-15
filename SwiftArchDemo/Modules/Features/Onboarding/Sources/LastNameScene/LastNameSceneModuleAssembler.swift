//
//  LastNameSceneAssembler.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit
import AppFoundation

@MainActor
final class LastNameSceneAssembler {
    class func makeView(
        usingLastName lastName: String?,
        onComplete: @escaping (_ lastName: String?) -> Void
    ) -> UIViewController {
        let viewController = LastNameSceneView()
        let presenter = LastNameSceneViewPresenter(
            view: viewController,
            lastName: lastName,
            onComplete: onComplete)
        viewController.presenter = presenter
        
        viewController.retainedModuleElements = [
            presenter
        ]
        
        return viewController
    }
}
