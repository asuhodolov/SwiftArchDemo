//
//  ApplicationRouter.swift
//  CurrenciesConverter
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import UIKit
import Root
import iTunesSearch

@MainActor
public final class ApplicationRouter: NSObject {
    let window: UIWindow
    let rootModule = RootModule()
    
    public required init(window: UIWindow) {
        self.window = window
    }
    
    public func presentRootController() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        rootModule.iTunesSearchRouter.pushSearch(
            into: navigationController,
            animated: false)
    }
}
