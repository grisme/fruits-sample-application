//
//  FruitsListAssembly.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit

class FruitsListAssembly: NSObject {

    class func buildFruitsList() -> UIViewController {
        let view = FruitsListViewController()
        let presenter = FruitsListPresenter()
        let interactor = FruitsListInteractor()
        let router = FruitsListRouter()
        let fruitsService = FruitsService()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.fruitsService = fruitsService
        router.view = view

        return view
    }

}
