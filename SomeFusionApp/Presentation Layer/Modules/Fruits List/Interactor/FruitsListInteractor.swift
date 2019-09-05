//
//  FruitsListInteractor.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation
import RxSwift

class FruitsListInteractor {
    // Public injections
    var fruitsService: FruitsServiceProtocol?
}

extension FruitsListInteractor: FruitsListInteractorProtocol {

    func obtainFruits() -> ReplaySubject<[Fruit]> {

        let subject = ReplaySubject<[Fruit]>.createUnbounded()
        fruitsService?.obtainFruits(success: { (fruits) in
            subject.onNext(fruits)
        }, failure: { (error) in
            subject.onError(error)
        })
        return subject

    }
}
