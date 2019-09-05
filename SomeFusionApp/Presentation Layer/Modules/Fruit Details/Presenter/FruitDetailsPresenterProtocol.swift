//
//  FruitDetailsPresenterProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

protocol FruitDetailsPresenterProtocol: class {
    var fruitIdentifier: Int { get set }
    func viewDidLoad()
}
