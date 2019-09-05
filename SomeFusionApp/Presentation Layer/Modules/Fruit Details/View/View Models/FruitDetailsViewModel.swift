//
//  FruitDetailsViewModel.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

struct FruitDetailsViewModel {

    private let fruit: Fruit

    init(fruit: Fruit) {
        self.fruit = fruit
    }

    func symbol() -> String {
        return fruit.displaySymbol
    }

    func title() -> String {
        return fruit.displayName
    }

    func subtitle() -> String {
        return fruit.descriptionText
    }

}
