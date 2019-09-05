//
//  AppDelegate.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coreWindow: UIWindow?

    // MARK: - Lifecycle methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        coreWindow = UIWindow(frame: UIScreen.main.bounds)
        coreWindow?.rootViewController = buildFirstModule()
        coreWindow?.makeKeyAndVisible()

        return true
    }

    // MARK: - Private methods
    private func buildFirstModule() -> UIViewController {
        let moduleViewController = FruitsListAssembly.buildFruitsList()
        let targetViewController = UINavigationController(rootViewController: moduleViewController)
        return targetViewController
    }

}

