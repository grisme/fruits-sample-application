//
//  FruitsServiceProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

protocol FruitsServiceProtocol: class {

    func obtainFruits(success: @escaping(_ fruits: [Fruit]) -> Void, failure: @escaping(_ error: Error) -> Void)
    func obtainFruit(with identifier: Int, success: @escaping(_ fruit: Fruit?) -> Void, failure: @escaping(_ error: Error) -> Void)

}
