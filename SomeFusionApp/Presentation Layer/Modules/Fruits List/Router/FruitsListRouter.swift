//
//  FruitsListRouter.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit

class FruitsListRouter {
    weak var view: UIViewController?
}

extension FruitsListRouter: FruitsListRouterProtocol {

    func openFruitDetails(fruitIdentifier: Int) {
        let fruitDetailsViewController = FruitDetailsAssembly.buildFruitDetails(with: fruitIdentifier)
        view?.navigationController?.pushViewController(fruitDetailsViewController, animated: true)
    }

}
