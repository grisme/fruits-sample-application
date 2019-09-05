//
//  FruitsListInteractorProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation
import RxSwift

protocol FruitsListInteractorProtocol: class {

    var fruitsService: FruitsServiceProtocol? { get set }
    func obtainFruits() -> ReplaySubject<[Fruit]>

}
