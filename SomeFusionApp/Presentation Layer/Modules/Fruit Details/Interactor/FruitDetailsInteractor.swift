//
//  FruitDetailsInteractor.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 06.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation
import RxSwift

class FruitDetailsInteractor {
    var fruitService: FruitsServiceProtocol!
}

extension FruitDetailsInteractor: FruitDetailsInteractorProtocol {
    func obtainFruitWithIdentifier(identifier: Int) -> ReplaySubject <Fruit> {
        let subject = ReplaySubject <Fruit>.createUnbounded()
        fruitService.obtainFruit(with: identifier, success: { fruit in
            subject.onNext(fruit!)
        }) { error in
            subject.onError(error)
        }
        return subject
    }
}
