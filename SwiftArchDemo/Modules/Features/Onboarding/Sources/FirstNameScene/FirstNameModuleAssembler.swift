//
//  FirstNameSceneAssembler.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit

@MainActor
final class FirstNameSceneAssembler {
    class func makeView(
        usingFirstName firstName: String?,
        onComplete: @escaping (_ firstName: String?) -> Void
    ) -> UIViewController {
        let viewController = FirstNameView()
        let presenter = FirstNameViewPresenter(
            view: viewController,
            firstName: firstName,
            onComplete: onComplete)
        viewController.presenter = presenter
        
        viewController.retainedModuleElements = [
            presenter
        ]
        
        return viewController
    }
}
