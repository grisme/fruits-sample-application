//
//  FruitDetailsAssembly.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit

class FruitDetailsAssembly {

    class func buildFruitDetails(with fruitIdentifier: Int) -> UIViewController {
        let view = FruitDetailsViewController()
        let presenter = FruitDetailsPresenter(fruitIdentifier: fruitIdentifier)
        let interactor = FruitDetailsInteractor()
        let fruitService = FruitsService()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.fruitService = fruitService

        return view
    }

}
