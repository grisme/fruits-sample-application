//
//  FruitsListPresenterProtocol.swift
//  SomeFusionApp
//
//  Created by Eugene Garifullin on 05.09.2019.
//  Copyright © 2019 Grisme Team, LLC. All rights reserved.
//

import Foundation

protocol FruitsListPresenterProtocol {

    var view: FruitsListViewProtocol! { get set }
    var interactor: FruitsListInteractorProtocol! { get set }
    var router: FruitsListRouterProtocol! { get set }

    func viewDidLoad()
    func didSelectFruit(fruit: FruitViewModel)

}
