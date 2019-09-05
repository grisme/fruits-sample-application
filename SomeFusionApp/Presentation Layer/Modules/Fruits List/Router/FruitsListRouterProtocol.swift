//
//  FruitsListRouterProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import UIKit

protocol FruitsListRouterProtocol: class {
    var view: UIViewController? { get set }

    func openFruitDetails(fruitIdentifier: Int)
}
