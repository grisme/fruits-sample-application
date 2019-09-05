//
//  FruitsService.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

// MARK: - Fruits service implementation
class FruitsService {

}

// MARK: - FruitsServiceProtocol implementation
extension FruitsService: FruitsServiceProtocol {
    func obtainFruits(success: @escaping ([Fruit]) -> Void, failure: @escaping (Error) -> Void) {
        // Network or another data service long working imitation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            success(self.fruitsArray())
        }
    }

    func obtainFruit(with identifier: Int, success: @escaping (Fruit?) -> Void, failure: @escaping (Error) -> Void) {
        // Network or another data service long working imitation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            let fruitWithId = self.fruitsArray().first(where: { $0.identifier == identifier })
            success(fruitWithId)
        }
    }

    private func fruitsArray() -> [Fruit] {
        var result = [Fruit]()
        result.append(Fruit(identifier: 0, displaySymbol: "🍌", displayName: "Banana", descriptionText: "Bananas have thick inedible skins that turn yellow or red when ripe. As the most popular fruit in the world, they grow on trees in the subtropics and tropics. You can eat some varieties after skinning them, but some are inedible raw."))

        result.append(Fruit(identifier: 1, displaySymbol: "🍏", displayName: "Apple", descriptionText: "Apple, (Malus domestica), fruit of the domesticated tree Malus domestica (family Rosaceae), one of the most widely cultivated tree fruits. The apple is a pome (fleshy) fruit, in which the ripened ovary and surrounding tissue both become fleshy and edible."))

        result.append(Fruit(identifier: 2, displaySymbol: "🍑", displayName: "Peach", descriptionText: "Peach, (Prunus persica), fruit tree of the rose family (Rosaceae), grown throughout the warmer temperate regions of both the Northern and Southern hemispheres. Peaches are widely eaten fresh as a dessert fruit and are also baked in pies and cobblers; canned peaches are a staple commodity in many regions. Yellow-fleshed varieties are especially rich in vitamin A."))

        return result
    }
}
