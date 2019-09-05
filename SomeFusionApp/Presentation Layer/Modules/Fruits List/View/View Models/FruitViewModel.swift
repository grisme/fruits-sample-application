//
//  FruitViewModel.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

struct FruitViewModel {

    private let fruit: Fruit

    init(fruit: Fruit) {
        self.fruit = fruit
    }

    func caption() -> String {
        return fruit.displaySymbol + " " + fruit.displayName
    }

    func subtitle() -> String {
        return fruit.descriptionText
    }

    func identifier() -> Int {
        return fruit.identifier
    }
}
