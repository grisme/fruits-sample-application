//
//  FruitDetailsInteractorProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation
import RxSwift

protocol FruitDetailsInteractorProtocol: class {

    func obtainFruitWithIdentifier(identifier: Int) -> ReplaySubject <Fruit>

}
