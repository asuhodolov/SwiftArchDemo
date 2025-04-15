//
//  ApplicationDelegate.swift
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private lazy var appRouter: ApplicationRouter = {
        self.window = UIWindow()
        return ApplicationRouter(window: self.window!)
    }()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        appRouter.presentRootController()
        return true
    }
}
